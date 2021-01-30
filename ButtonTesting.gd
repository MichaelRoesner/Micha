extends Button

var random_enemy_count = null

func _ready():
	var button = Button.new()
	button.text = "Click me"
	button.connect("pressed", self, "_button_pressed")
	add_child(button)

func _button_pressed():
	randomize()
	random_enemy_count = int(rand_range(3, 9)) % 10
	print(random_enemy_count)


