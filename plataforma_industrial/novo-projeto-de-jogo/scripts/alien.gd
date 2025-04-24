extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -600.0
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")		

func _physics_process(delta: float) -> void:
	# Apply gravity if not on the floor
	if not is_on_floor():
		velocity.y += gravity * delta  # Ensure gravity is applied properly

	# Jump when the jump button is pressed and the character is on the floor
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get direction for horizontal movement (left/right)
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0.0:
		velocity.x = direction * SPEED
	else:
		# Smoothly decelerate to 0 if no input is detected
		velocity.x = move_toward(velocity.x, 0.0, SPEED)

	# Move the character using the updated velocity
	move_and_slide(
		
	)
