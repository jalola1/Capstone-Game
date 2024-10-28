extends Area2D

@export var speed: float = 200.0  # Speed at which the candy falls

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	# Start falling immediately when spawned
	set_process(true)

# Called every frame
func _process(delta: float) -> void:
	# Move the candy downwards
	position.y += speed * delta #moves the candy downward

# Function to handle collisions with the alien

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("alien"):
		queue_free()
