class_name Inimigos
extends Node2D

@export var health: int = 1
@export var death_prefab: PackedScene

func damage(amount: int) -> void:
	health -= amount
	print("Inimigo atingido:", amount, "A vida é:", health)
	
	#receber dano
	modulate = Color.RED
	var tween = create_tween()
	tween.set_ease(Tween.EASE_IN)
	tween.set_trans(Tween.TRANS_QUINT)
	tween.tween_property(self,"modulate",Color.WHITE,0.3)

	if health <= 0:
		morte()

func morte() -> void:
	if death_prefab:
		var death_object = death_prefab.instantiate()
		death_object.position = position
		get_parent().add_child(death_object)
		
	queue_free()
