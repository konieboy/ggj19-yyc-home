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


func _on_KinematicBody2D_hitSignal(stamina):
	print ("sound!")
	if (!self.playing): # make sure sound isnt already playing
		self.play(0)
	


func _on_KinematicBody2D_deathSignal():
	pass # replace with function body


func _on_KinematicBody2D_staminaSignal():
	pass # replace with function body
