# this is the player kinematic body
extends KinematicBody2D

const MOTION_SPEED = 200
const JOYPAD_DEADZONE = 0.6
var joypad_vec
var paused

# Used to inform the UI
signal deathSignal
signal staminaSignal
signal hitSignal

onready var startTime = OS.get_ticks_msec()

func _ready():
	joypad_vec = Vector2(0,0)
	paused = true

# Drain a tiny bit of stamina
func _process(delta):
	if (!paused):
		# if (not in home):
		get_parent().stamina -= 0.01
		emit_signal("staminaSignal", get_parent().stamina)
		print (startTime)

func _handleCollision(collision_info):
	print(collision_info.collider)
	joypad_vec = joypad_vec.bounce(collision_info.normal)
	
	
	if ((OS.get_ticks_msec() - startTime) > 500.0):
		startTime = OS.get_ticks_msec()	
		# Reduce stamina
		get_parent().stamina -= 5.0
		print(get_parent().stamina)
		emit_signal("hitSignal", get_parent().stamina)
		# Check if player is dead
		if (get_parent().stamina <= 0.0):
			print("Game Over - No Stamina")
			emit_signal("deathSignal")
	
			

func _physics_process(delta):
	if (!paused):
		# get joy stick vector
		var newjoypad_vec = Vector2(Input.get_joy_axis(0, 0), Input.get_joy_axis(0, 1))
	
		# Only change the joypad_vec if it's outside the deadzone
		# no normalization
		# this means the player can speed up or go back to a slower speed
		if newjoypad_vec.length() > JOYPAD_DEADZONE:
			joypad_vec = newjoypad_vec
	
		var collision_info = move_and_collide(joypad_vec * delta*MOTION_SPEED)
		if (collision_info != null):
			_handleCollision(collision_info)
