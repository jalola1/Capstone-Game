extends Node2D

# Function to switch to greyscale
func grey_scale():
	modulate = Color(0.5, 0.5, 0.5, 1) # Dims color for grayscale effect
	
# Function to restore the greyscale
func restore_scale():
	modulate = Color(1, 1, 1, 1) # Restores the grayscale effect
