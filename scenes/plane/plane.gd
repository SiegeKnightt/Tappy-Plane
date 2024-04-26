extends CharacterBody2D

const GRAVITY: float = 800.0

@export var jumpSpeed: float = -500.0

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	# Adds gravity
	velocity.y += GRAVITY * delta
	
	# Plane movement
	fly()
	
	# Checks if plane hits top/bottom
	if (is_on_floor() == true || is_on_ceiling() == true):
		die()
	
	move_and_slide()

# Movement function for the plane
func fly() -> void:
	if (Input.is_action_just_pressed("jump") == true):
		animation_player.play("power")
		velocity.y += jumpSpeed

# Stops animation and physics when plane hits ground/ceiling
func die() -> void:
	sprite.stop()
	set_physics_process(false)
