extends KinematicBody2D

export var ACCELERATION = 500
export var MAX_SPEED = 80

onready var sprite = $AnimatedSprite
var input_vector = Vector2.ZERO #input vector für Bewegungskalkulation
var state = MOVE #Start-State
var velocity = Vector2.ZERO #Berechnung für Geschwindigkeit

#State Machines
enum { MOVE, IDLE, INTERACT, DEATH} #Aufzählung der States, damit diese wie in Zeile 18 verwendet werden können

func _ready():
	#stats.connect("no_health", self, "queue_free")
	pass

func _physics_process(_delta):
	match state: # Wenn der Zustand vom Player MOVE,DASH,ATTACK,... enspricht, dann führe SM-Code aus
		MOVE:
			move_state()
		INTERACT:
			pass
		DEATH: 
			pass
			
	
func move_state(): # Bewegung
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:		
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION ) #* delta) #delta performance test
		animation()
		
	else:
		velocity = Vector2.ZERO
		animation()
		
	velocity = move_and_slide(velocity) #Sorgt für "weiterrutschen" bzw Bewegung während eines Inputs


func animation():
	if input_vector.y > 0 or input_vector.y < 0 or input_vector.x > 0 or input_vector.x < 0:
		if input_vector.x > 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
		sprite.play("run")
	else:
		sprite.play("idle")


