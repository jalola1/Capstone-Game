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
	
	if position.y > get_viewport_rect().size.y:
		Globals.powerupOnScreen = false
		queue_free()  # Remove candy

# Function to handle collisions with the alien
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("alien"):
		get_tree().current_scene.restore_life() # Restores a life when it comes into contact with the alien
		Globals.powerupOnScreen = false 
		queue_free()  # Remove the chocolate after collection
