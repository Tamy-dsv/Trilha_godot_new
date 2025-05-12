extends CharacterBody2D

@export var speed: float = 3
@onready var sprite: Sprite2D = $sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var is_running: bool = false
var is_attacking: bool = false
var attack_cooldown: float = 0.0

func _process(delta: float) -> void:
	# Atualiza temporizador de ataque
	if is_attacking:
		attack_cooldown -= delta
		if attack_cooldown <= 0.0:
			is_attacking = false
			animation_player.play("parado")

func _physics_process(delta: float) -> void:
	var input_vector = Input.get_vector("mover_esquerda", "mover_direita", "mover_cima", "mover_baixo")

	# Zona morta (deadzone)
	if abs(input_vector.x) < 0.15:
		input_vector.x = 0.0
	if abs(input_vector.y) < 0.15:
		input_vector.y = 0.0

	var target_velocity = input_vector * speed * 100.0
	if is_attacking:
		target_velocity *= 0.25

	velocity = lerp(velocity, target_velocity, 0.05)
	move_and_slide()

	# Atualiza estado de corrida
	var was_running = is_running
	is_running = not input_vector.is_zero_approx()

	# Toca a animação apropriada
	if was_running != is_running:
		if is_running:
			animation_player.play("correr")
		else:
			animation_player.play("parado")

	# Gira o sprite com base na direção
	if input_vector.x > 0:
		sprite.flip_h = false
	elif input_vector.x < 0:
		sprite.flip_h = true

	# Detecta ataque
	if Input.is_action_just_pressed("ataque"):
		attack()

func attack() -> void:
	if is_attacking:
		return

	animation_player.play("ataque_cima-baixo")
	attack_cooldown = 0.6
	is_attacking = true
