extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -250.0
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isOnePressing = false

func _physics_process(delta):
	#Animations
	if(velocity.x>1 || velocity.x <-1):
		sprite_2d.animation="running"
	else:
		sprite_2d.animation="default"
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation="jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.aaaaaaaaaaaaaaaaaaw
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x<0
	sprite_2d.flip_h = isLeft
	
	


func _on_area_2d_area_entered(area):
	if area.is_in_group("trap"):
		get_tree().reload_current_scene()
	if area.is_in_group("level2"):
		Ready.isReady1=true
	if area.is_in_group("level3"):
		Ready.isReady1=true
	if area.is_in_group("BackToMain"):
		Ready.isReady1=true

func _process(_delta):
	if Input.is_action_pressed("restart"):
		get_tree().reload_current_scene()
	if Input.is_action_pressed("main"):
		get_tree().change_scene_to_file("res://LevelSelection.tscn")
