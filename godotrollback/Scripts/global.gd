extends Node

# Steam variables
var OWNED = false
var ONLINE = false
var STEAM_ID = 0

func _ready():
	var INIT = Steam.steamInit()
	print("Did Steam initialize?: "+str(INIT))
	
	if INIT['status'] != 1:
		print("Failed to initialize Steam. "+str(INIT['verbal'])+" Shutting down...")
		get_tree().quit()
	
	ONLINE = Steam.loggedOn()
	STEAM_ID = Steam.getSteamID()
	OWNED = Steam.isSubscribed()
	
#	# Check if account owns the game
#	if OWNED == false:
#		print("User does not own this game")
#		get_tree().quit()

func _process(delta):
	Steam.run_callbacks()
