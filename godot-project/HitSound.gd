extends AudioStreamPlayer2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_KinematicBody2D_staminaSignal(stamina):
	print ("sound!")
	if (!self.playing): # make sure sound isnt already playing
		self.play(0)
	
