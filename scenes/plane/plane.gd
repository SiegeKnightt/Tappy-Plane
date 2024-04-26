extends CharacterBody2D

const GRAVITY: float = 800.0

var jumpSpeed: float = -400.0

@onready var sprite: AnimatedSprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Adds gravity
	velocity.y += GRAVITY * delta
	
	if (is_on_floor() == true || is_on_ceiling() == true):
		die()
	
	if (Input.is_action_just_pressed("jump")):
		velocity.y += jumpSpeed
	
	move_and_slide()

# Stops animation and physics when plane hits ground/ceiling
func die() -> void:
	sprite.stop()
	set_physics_process(false)
