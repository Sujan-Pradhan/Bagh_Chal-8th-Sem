extends Node2D
#AI Goat

var player2 = true
onready var all_Placed
onready var parent = get_node(".")
var demo_move
var final_move
var final_move2
var root_move
#var semi_final_move
#move halne bela hajik ma k k move haru xan tyo haleko xa
onready var neighbouring_values#= [null,null,null] #depth[0,1,2,3]


#kun level ko neighbour ma kun kun zone parxa
onready var neighbouring_nodes#= [null,null,null] 

var demo=0

var killer_moves = [
	#first is root(potential final) node second is goat vako node ani third chai tiger xa ki nai vanne
	["Zone1","Zone2","Zone3"],     ["Zone1","Zone6","Zone11"],    ["Zone1","Zone7","Zone13"],    ["Zone2","Zone3","Zone4"],     ["Zone2","Zone7","Zone12"],
	["Zone3","Zone2","Zone1"],     ["Zone3","Zone4","Zone5"],     ["Zone3","Zone7","Zone11"],    ["Zone3","Zone8","Zone13"],    ["Zone3","Zone9","Zone15"],
	["Zone4","Zone3","Zone2"],     ["Zone4","Zone9","Zone14"],    ["Zone5","Zone4","Zone3"],     ["Zone5","Zone9","Zone13"],    ["Zone5","Zone10","Zone15"],
	["Zone6","Zone7","Zone8"],     ["Zone6","Zone11","Zone16"],   ["Zone7","Zone8","Zone9"],     ["Zone7","Zone12","Zone17"],   ["Zone7","Zone13","Zone19"],
	["Zone8","Zone7","Zone6"],     ["Zone8","Zone9","Zone10"],    ["Zone8","Zone13","Zone18"],   ["Zone9","Zone8","Zone7"],     ["Zone9","Zone13","Zone17"],
	["Zone9","Zone14","Zone19"],   ["Zone10","Zone9","Zone8"],    ["Zone10","Zone15","Zone20"],  ["Zone11","Zone6","Zone1"],    ["Zone11","Zone7","Zone3"],
	["Zone11","Zone12","Zone13"],  ["Zone11","Zone16","Zone21"],  ["Zone12","Zone7","Zone2"],    ["Zone12","Zone13","Zone14"],  ["Zone12","Zone17","Zone22"],
	["Zone13","Zone7","Zone1"],    ["Zone13","Zone8","Zone3"],    ["Zone13","Zone9","Zone5"],    ["Zone13","Zone12","Zone11"],  ["Zone13","Zone14","Zone15"],
	["Zone13","Zone17","Zone21"],  ["Zone13","Zone18","Zone23"],  ["Zone13","Zone19","Zone25"],  ["Zone14","Zone9","Zone4"],    ["Zone14","Zone13","Zone12"],
	["Zone14","Zone19","Zone24"],  ["Zone15","Zone10","Zone5"],   ["Zone15","Zone14","Zone13"],  ["Zone15","Zone19","Zone23"],  ["Zone15","Zone20","Zone25"],
	["Zone16","Zone11","Zone6"],   ["Zone16","Zone17","Zone18"],  ["Zone17","Zone12","Zone7"],   ["Zone17","Zone18","Zone19"],  ["Zone18","Zone17","Zone16"],
	["Zone18","Zone13","Zone8"],   ["Zone18","Zone19","Zone20"],  ["Zone19","Zone13","Zone7"],   ["Zone19","Zone14","Zone9"],   ["Zone19","Zone18","Zone17"],
	["Zone20","Zone15","Zone10"],  ["Zone20","Zone19","Zone18"],  ["Zone21","Zone16","Zone11"],  ["Zone21","Zone17","Zone13"],  ["Zone21","Zone22","Zone23"],
	["Zone22","Zone17","Zone12"],  ["Zone22","Zone23","Zone24"],  ["Zone23","Zone22","Zone21"],  ["Zone23","Zone18","Zone13"],  ["Zone23","Zone24","Zone25"],
	["Zone24","Zone19","Zone14"],  ["Zone24","Zone23","Zone22"],  ["Zone25","Zone19","Zone13"],  ["Zone25","Zone20","Zone15"],  ["Zone25","Zone24","Zone23"]
]



# Called when the node enters the scene tree for the first time.
func _ready():
	all_Placed = 0
	goat_selection()


func goat_selection():
	var child
	var killer_move = killer_evaluation();
	if killer_move:
		var n = parent.get_child_count()
		child = parent.get_child(n-1)
		move_child(child,0)
	else:
		neighbouring_nodes = [null,null,null]
		neighbouring_values = [null,null,null]
		var present_negamax_value = null
		var max_negamax_value= -100
		if all_Placed<20:
			var n = parent.get_child_count()
			child = parent.get_child(n-1)
			for demo_move in get_parent().zones:
				if get_parent().item_in_zone[demo_move][0]==null:
					present_negamax_value = abs(negamax(demo_move))
					if present_negamax_value > max_negamax_value:
						max_negamax_value= present_negamax_value
						final_move = demo_move
					
				else:
					pass
			move_child(child,0)
			
		else:
			final_move2 =null
			root_move = null
			var goat_value = 0
			var final_moves = [null,null,null,null]
			var which_goat = [-1000,null,null]
			for goat in self.get_children ():
				var goat_location = goat.get_position()
				goat_location = goat_location.round()
				for pos in get_parent().gameplay_position:
					if get_parent().gameplay_position[pos] == goat_location:
						var goat_position = pos
						demo_move = goat_position
						var negamax_val = negamax(goat_position)
						if negamax_val >= which_goat[0]:
							root_move = demo_move
							which_goat = [negamax_val,goat_value,final_move2]
				goat_value = goat_value+1
			child = parent.get_child(which_goat[1])
			final_move2 = which_goat[2] 
			move_child(child,0)
			


func negamax(position, depth = 0, alpha = -1000, beta = 1000, color = 1):
	
	var max_val = -1000
	if depth == 3:
		return evaluation_function(position)
	else:
		if all_Placed<20:
			neighbouring_nodes[depth] = position
			neighbouring_values[depth] =get_parent().item_in_zone[position][0]
			for move in get_parent().allowed_moves[position]:
				var repeat = false
				for i in range(0,depth):
					if move == neighbouring_nodes[i]:
						repeat = true
				
				if repeat==false :
					max_val = max(max_val,-negamax(move,depth+1,-beta,-alpha,-color))
					alpha = max(alpha, max_val)
					if alpha>= beta:
						final_move2 = move
						return alpha
				else:
					pass
		else:
			for move in get_parent().allowed_moves[position]:
				if get_parent().item_in_zone[move][0] ==null:
					if move != root_move:
						max_val = max(max_val,-negamax(move,depth+1,-beta,-alpha,-color))
						alpha = max(alpha, max_val)
						final_move2 = move
						if alpha>= beta:
							return alpha
				else:
					pass
				
	return max_val


func evaluation_function(pos): 
	if neighbouring_values[1] =="goat" and  neighbouring_values[2] == "tiger":
		return 15
	elif neighbouring_nodes[0]=="Zone1" or neighbouring_nodes[0]=="Zone5" or neighbouring_nodes[0]=="Zone21" or neighbouring_nodes[0]=="Zone25":
		if neighbouring_values[0] == null:
			return 10
	elif neighbouring_values[1] =="goat" and  neighbouring_values[2] == "goat":
		return 7
	elif neighbouring_values[1] =="goat" and  neighbouring_values[2] == null:
		return 8
	elif neighbouring_values[1] =="tiger" and  neighbouring_values[2] == "tiger":
		return 0
	elif neighbouring_values[1] =="tiger" and  neighbouring_values[2] == "goat":
		return 0
	elif neighbouring_values[1] =="tiger" and  neighbouring_values[2] == null:
		return 0
	elif neighbouring_values[1] ==null  and  neighbouring_values[2] == "tiger":
		return 4
	elif neighbouring_values[1] ==null  and  neighbouring_values[2] == "goat":
		return 5
	elif neighbouring_values[1] ==null  and  neighbouring_values[2] == null:
		return 9




func killer_evaluation():
	for move in killer_moves:
		if get_parent().item_in_zone[move[0]][0] == null:
			if get_parent().item_in_zone[move[1]][0] == "goat" and get_parent().item_in_zone[move[2]][0] == "tiger":
				final_move = move[0]
				return true
		else:
			pass
	return false



func _on_Tiger_Player_tigerplayerturnfinished():
	player2 = true
	goat_selection()


func _on_Tiger_Player2_tigerplayerturnfinished():
	player2 = true
	goat_selection()


func _on_Tiger_Player3_tigerplayerturnfinished():
	player2 = true
	goat_selection()


func _on_Tiger_Player4_tigerplayerturnfinished():
	player2 = true
	goat_selection()
