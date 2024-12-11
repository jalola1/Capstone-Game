extends Area2D

@export var speed: float = 200.0  # Speed at which the candy falls
@export var fall_speed_multiplier = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Start falling immediately when spawned
	set_process(true)

# Called every frame
func _process(delta: float) -> void:
	# Move the candy downwards
	position.y += speed * delta #moves the candy downward
	
	# Check if the candy reaches the bottom of the screen
	if position.y > get_viewport_rect().size.y:
		Globals.powerupOnScreen = false
		queue_free()  # Remove candy

# Function to handle collisions with the alien
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("alien"):
		# Activate the frozen effect in the main script
		get_parent().call("activate_frozen_mode")
		Globals.powerupOnScreen = false 
		queue_free()
