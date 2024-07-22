extends Node2D

#AI Tiger using algorithm
var player1 = false
onready var parent = get_node(".")
onready var goat_eaten = 0
var final_position
var final_moves 
var root_position
var which_tiger  #first chai value second chai player third chai final position
var tiger_value
var hash_value 

onready var killer_moves = [
	#first is root node second is goat vako node ani third chai final position
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


 

var zorbrist_hashing = { #first value tiger ko second value goat ko
	#first ko 2 char zone no third ko char 0 ani last ko 2 char goat ki tiger
	#01 tiger 00 goat
	"Zone1" : [01001,01000],
	"Zone2" : [02001,02000],
	"Zone3" : [03001,03000],
	"Zone4" : [04001,04000],
	"Zone5" : [05001,05000],
	"Zone6" : [06001,06000],
	"Zone7" : [07001,07000],
	"Zone8" : [08001,08000],
	"Zone9" : [09001,09000],
	"Zone10" : [10001,10000],
	"Zone11" : [11001,11000],
	"Zone12" : [12001,12000],
	"Zone13" : [13001,13000],
	"Zone14" : [14001,14000],
	"Zone15" : [15001,15000],
	"Zone16" : [16001,16000],
	"Zone17" : [17001,17000],
	"Zone18" : [18001,18000],
	"Zone19" : [19001,19000],
	"Zone20" : [20001,20000],
	"Zone21" : [21001,21000],
	"Zone22" : [22001,22000],
	"Zone23" : [23001,23000],
	"Zone24" : [24001,24000],
	"Zone25" : [25001,25000]
}

var zorbrist_table = {
	
}

func tiger_selection():	
	var child
	
	final_position = null
	var is_killer = killer_evaluation()
	if is_killer == false:
		tiger_value = 0
		final_moves = [null,null,null,null]
		which_tiger = [-1000,null,null]
		hash_value = hash_indexing()
		for tiger in self.get_children ():
			var tiger_location = tiger.get_position()
			tiger_location = tiger_location.round()
			for pos in get_parent().gameplay_position:
				if get_parent().gameplay_position[pos] == tiger_location:
					var tiger_position = pos
					root_position = tiger_position
					var negamax_val = negamax(tiger_position)
					zorbrist_table[hash_value] = [tiger_position,final_position,negamax_val]
					final_moves[tiger_value] = final_position
					if negamax_val >= which_tiger[0]:
						which_tiger = [negamax_val,tiger_value,final_moves[tiger_value]]
			tiger_value = tiger_value+1
		child = parent.get_child(which_tiger[1])
		final_position = which_tiger[2] 
	
	else:
		child = parent.get_child(which_tiger)
	
	
	if goat_eaten >= 5:
		goat_eaten = 0
		get_tree().change_scene("res://Main Project/Levels and interface/Tiger won.tscn")
	if final_position ==null:
		print(" Tiger for AI algorithm Defeated true vayo")
		get_tree().change_scene("res://Main Project/Levels and interface/Goat won.tscn")
	print(final_moves)
	move_child(child,0)





func negamax(position, depth = 0, alpha = -1000, beta = 1000, color = 1):
	for val in zorbrist_table:
		if hash_value == val and position == zorbrist_table[val][0] and depth == 2:
			final_position = zorbrist_table[val][1]
			#print("table use vayo")
			return zorbrist_table[val][2]
	
	var max_val = -1000
	if depth == 3:
		return evaluation_function(position)
	else:
		
		for move in get_parent().allowed_moves[position]:
			
			if get_parent().item_in_zone[move][0] ==null:
				if move != root_position:
					max_val = max(max_val,-negamax(move,depth+1,-beta,-alpha,-color))
					alpha = max(alpha, max_val)
					final_position = move
					if alpha>= beta:
						return alpha
			else:
				pass
	return max_val


func evaluation_function(pos):
	if get_parent().item_in_zone[pos][0] == null:
		return 5
	elif get_parent().item_in_zone[pos][0] == "goat":
		return 10
	else:
		return 0


func killer_evaluation():
	var tiger_num = 0
	for tiger in self.get_children ():
		var tiger_location = tiger.get_position()
		var tiger_position
		tiger_location = tiger_location.round()
		for pos in get_parent().gameplay_position:
			if get_parent().gameplay_position[pos] == tiger_location:
				tiger_position = pos
				root_position = tiger_position
				for i in range(0,killer_moves.size(),1):
					
					if killer_moves[i][0] == root_position:
						
						if get_parent().item_in_zone[killer_moves[i][1]][0] =="goat" and get_parent().item_in_zone[killer_moves[i][2]][0] ==null:
							
							final_position = killer_moves[i][2]
							which_tiger = tiger_num
							var goat_path = get_parent().item_in_zone[killer_moves[i][1]][1]
							var goat = get_node(goat_path)
							goat.queue_free()
							goat_eaten = goat_eaten+1
							get_parent().item_in_zone[killer_moves[i][1]][0] = null
							
							return true
		tiger_num = tiger_num+1
	return false

func hash_indexing():
	var hash_val = 0
	for hash_VAL in get_parent().zones:
		if get_parent().item_in_zone[hash_VAL][0] == "goat":
			hash_val = hash_val ^ zorbrist_hashing[hash_VAL][1]
		elif get_parent().item_in_zone[hash_VAL][0] == "tiger":
			hash_val = hash_val ^ zorbrist_hashing[hash_VAL][0]
		else:
			pass
	return hash_val



func _on_Goat_AI_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI2_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI3_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI4_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI5_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI6_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI7_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI8_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI9_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI10_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI11_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI12_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI13_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI14_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI15_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI16_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI17_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI18_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI19_demoaiturnfinished():
	player1= true
	tiger_selection()


func _on_Goat_AI20_demoaiturnfinished():
	player1= true
	tiger_selection()


