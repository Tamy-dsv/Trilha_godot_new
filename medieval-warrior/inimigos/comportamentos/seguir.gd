extends Node

@export var speed = 1

var inimigos: Inimigos
var sprite: AnimatedSprite2D 


func _ready():
	inimigos = get_parent()
	sprite = inimigos.get_node("AnimatedSprite2D") 
	inimigos.health
	pass
	
func _physics_process(delta: float) -> void:
	var player_position = GameManeger.player_position
	var diference = player_position - inimigos.position 
	var input_vector = diference.normalized()
	

	#input vector
	inimigos.velocity = input_vector * speed * 100.0
	inimigos.move_and_slide()
  		
		
		# Girar o sprite 	
	if input_vector.x > 0:
		sprite.flip_h = false
	elif input_vector.x < 0:		
		sprite.flip_h = true	
