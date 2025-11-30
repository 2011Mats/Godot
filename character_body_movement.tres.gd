extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -350.0
var punkte = 0
var leben = 3

@onready var player_sprite = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement input
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction > 0:
			player_sprite.scale.x = abs(player_sprite.scale.x)
		else:
			player_sprite.scale.x = -abs(player_sprite.scale.x)

		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Animations
	if is_on_floor():
		if velocity.x == 0:
			player_sprite.play("ruhe")
		else:
			player_sprite.play("laufen")
	else:
		if velocity.y < 0:
			player_sprite.play("springen") # jump


	move_and_slide()
	
	
