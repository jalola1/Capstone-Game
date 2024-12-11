extends Area2D

#@export var speed: float = 200.0  # Speed at which the candy falls

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Start falling immediately when spawned
	set_process(true)

# Called every frame
func _process(delta: float) -> void:
	# Move the candy downwards
	position.y += Globals.candiesSpeed * delta #moves the candy downward
	
	# Check if the candy reaches the bottom of the screen
	if position.y > get_viewport_rect().size.y:
		var main_game = get_tree().root.get_node("Main")
		if main_game: # Check if main node is set
			main_game.lose_life()  # Calls lose life when the candy falls off screen
		queue_free()  # Remove candy

# Function to handle collisions with the alien
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("alien"):
		get_tree().current_scene.update_score(1)
		queue_free()
