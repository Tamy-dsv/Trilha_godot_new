class_name Player 
extends Node2D

@export var regeneration_amount: int = 10


func _ready():
	$Area2D.body_entered.connect.connect(on_body_entered)
	
func on_body_entered(body:Node2D) -> void:
	if body.is_in_group("player"):
		var player: Player = body
		player.heal(regeneration_amount)
		
	
	
	

	
	
	
