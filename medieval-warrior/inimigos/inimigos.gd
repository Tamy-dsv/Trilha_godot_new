class_name Inimigos
extends Node2D

@export var health: int = 10
func damage(amount:int) ->void:
	health -=amount
	print("inimigo atingido",amount,"a vida e",health)
