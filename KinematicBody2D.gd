extends KinematicBody2D


var speed = 1000
var velocity = Vector2()
var notFired = true
var timePassed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	timePassed+=delta
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	var info = move_and_collide(velocity * delta)
	if info != null && notFired:
		print("collider"+str(info.collider))
		print("collider metadata"+str(info.collider_metadata))
		print("collider rid"+str(info.collider_rid))
		print("collider shape"+str(info.collider_shape))
		print("collider velocity"+str(info.collider_velocity))
		print("collider angle"+str(info.get_angle()))
		print("collider position"+str(info.position))
		notFired=false
		print(info.collider.position*2)
		print(info.position/(info.collider.position*2))
		
	if int(timePassed*100)%10==0&&!notFired:
		print(int(timePassed))
		notFired=true
