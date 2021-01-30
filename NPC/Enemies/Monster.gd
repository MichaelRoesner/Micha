extends KinematicBody2D

export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200
export var WANDER_TARGET_RANGE = 4

enum {
	IDLE,
	WANDER,
	CHASE
}

var velocity = Vector2.ZERO

var state = CHASE

onready var sprite = $AnimatedSprite
onready var playerDetectionZone = $PlayerDetectionZone
onready var wanderState = $WanderState

func _ready():
	state = pick_random_state([IDLE, WANDER])

func _physics_process(delta):

	match state:
		IDLE:
			sprite.play("idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
			if wanderState.get_time_left() == 0:
				update_wander()
				
		WANDER:
			seek_player()
			sprite.play("move")
			if wanderState.get_time_left() == 0:
				update_wander()
			accelerate_towards_point(wanderState.target_position, delta)
			if global_position.distance_to(wanderState.target_position) <= WANDER_TARGET_RANGE:
				update_wander()
			
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				accelerate_towards_point(player.global_position, delta)
			else:
				state = IDLE


func accelerate_towards_point(point, delta):
	sprite.play("move")
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x < 0

func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE

func update_wander():
	state = pick_random_state([IDLE, WANDER])
	wanderState.start_wander_timer(rand_range(1, 3))

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()
