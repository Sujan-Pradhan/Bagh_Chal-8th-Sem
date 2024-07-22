extends Node2D

export var zones = [
	"Zone1","Zone2","Zone3","Zone4","Zone5",
	"Zone6","Zone7","Zone8","Zone9","Zone10",
	"Zone11","Zone12","Zone13","Zone14","Zone15",
	"Zone16","Zone17","Zone18","Zone19","Zone20",
	"Zone21","Zone22","Zone23","Zone24","Zone25"
 ]

export var allowed_moves = {
		"Zone1": ["Zone2","Zone6","Zone7"],
		"Zone2": ["Zone1","Zone3","Zone7"],
		"Zone3": ["Zone2","Zone4","Zone7","Zone8","Zone9"],
		"Zone4": ["Zone3","Zone5","Zone9"],
		"Zone5": ["Zone4","Zone9","Zone10"],
		"Zone6": ["Zone1","Zone7","Zone11"],
		"Zone7": ["Zone1","Zone2","Zone3","Zone6","Zone8","Zone11","Zone12","Zone13"],
		"Zone8": ["Zone3","Zone7","Zone9","Zone13"],
		"Zone9": ["Zone3","Zone4","Zone5","Zone8","Zone10","Zone13","Zone14","Zone15"],
		"Zone10": ["Zone5","Zone9","Zone15"],
		"Zone11": ["Zone6","Zone7","Zone12","Zone16","Zone17"],
		"Zone12": ["Zone7","Zone11","Zone13","Zone17"],
		"Zone13": ["Zone7","Zone8","Zone9","Zone12","Zone14","Zone17","Zone18","Zone19"],
		"Zone14": ["Zone9","Zone13","Zone15","Zone19"],
		"Zone15": ["Zone10","Zone14","Zone19","Zone20"],
		"Zone16": ["Zone11","Zone17","Zone21"],
		"Zone17": ["Zone11","Zone12","Zone13","Zone16","Zone18","Zone21","Zone22","Zone23"],
		"Zone18": ["Zone13","Zone17","Zone19","Zone23"],
		"Zone19": ["Zone13","Zone14","Zone15","Zone18","Zone20","Zone23","Zone24","Zone25"],
		"Zone20": ["Zone15","Zone19","Zone25"],
		"Zone21": ["Zone16","Zone17","Zone22"],
		"Zone22": ["Zone17","Zone21","Zone23"],
		"Zone23": ["Zone17","Zone18","Zone19","Zone22","Zone24"],
		"Zone24": ["Zone19","Zone23","Zone25"],
		"Zone25": ["Zone19","Zone20","Zone24"]
		
	}


export var gameplay_position = {
	"Zone1" : Vector2(200,100),
	"Zone2" : Vector2(300,100),
	"Zone3" : Vector2(400,100),
	"Zone4" : Vector2(500,100),
	"Zone5" : Vector2(600,100),
	"Zone6" : Vector2(200,200),
	"Zone7" : Vector2(300,200),
	"Zone8" : Vector2(400,200),
	"Zone9" : Vector2(500,200),
	"Zone10" : Vector2(600,200),
	"Zone11" : Vector2(200,300),
	"Zone12" : Vector2(300,300),
	"Zone13" : Vector2(400,300),
	"Zone14" : Vector2(500,300),
	"Zone15" : Vector2(600,300),
	"Zone16" : Vector2(200,400),
	"Zone17" : Vector2(300,400),
	"Zone18" : Vector2(400,400),
	"Zone19" : Vector2(500,400),
	"Zone20" : Vector2(600,400),
	"Zone21" : Vector2(200,500),
	"Zone22" : Vector2(300,500),
	"Zone23" : Vector2(400,500),
	"Zone24" : Vector2(500,500),
	"Zone25" : Vector2(600,500)
	
}




export var item_in_zone = {
	#first null vaneko tiger ki goat second null chai position
	"Zone1" : ["tiger",null],
	"Zone2" : [null,null],
	"Zone3" : [null,null],
	"Zone4" : [null,null],
	"Zone5" : ["tiger",null],
	"Zone6" : [null,null],
	"Zone7" : [null,null],
	"Zone8" : [null,null],
	"Zone9" : [null,null],
	"Zone10" :[null,null],
	"Zone11" : [null,null],
	"Zone12" : [null,null],
	"Zone13" : [null,null],
	"Zone14" : [null,null],
	"Zone15" : [null,null],
	"Zone16" : [null,null],
	"Zone17" : [null,null],
	"Zone18" : [null,null],
	"Zone19" : [null,null],
	"Zone20" : [null,null],
	"Zone21" : ["tiger",null],
	"Zone22" : [null,null],
	"Zone23" : [null,null],
	"Zone24" : [null,null],
	"Zone25" : ["tiger",null]
	
}
