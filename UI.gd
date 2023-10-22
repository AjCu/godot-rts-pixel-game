extends CanvasLayer

@onready var woodLabel = $WoodLabel
@onready var goldLabel = $GoldLabel
@onready var FoodLabel = $FoodLabel

func _ready():
	woodLabel.position = Vector2(5,00)
	goldLabel.position = Vector2(5,40)
	FoodLabel.position = Vector2(5,80)
	
func _process(delta):
	woodLabel.text = "Madera: " + str(Game.Wood)
	goldLabel.text = "Oro: " + str(Game.Gold)
	FoodLabel.text = "Comida: " + str(Game.Food)
