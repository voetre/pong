extends KinematicBody2D

var speed = 450
var velocity = Vector2.ZERO
var rng = RandomNumberGenerator.new()

func _ready():
	prepare_ball()

func prepare_ball():
	randomize()
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]

func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
		$CollisionSound.pitch_scale = rng.randf_range(1,1.20)
		$CollisionSound.play()
		speed += 15

func stop_ball():
	speed = 0

func restart_ball():
	speed = 450
	prepare_ball()
