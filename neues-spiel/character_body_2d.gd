# Player.gd
extends CharacterBody2D

@export var speed: float = 200.0  # Movement speed in pixels/sec

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	# Get input
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1

	# Normalize to prevent faster diagonal movement
	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized() * speed

	# Assign velocity
	velocity = input_vector

	# Move the character
	move_and_slide()
