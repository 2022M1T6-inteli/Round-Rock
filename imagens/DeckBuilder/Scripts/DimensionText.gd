extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Defines the text of the title label according to the selected dimension
func _ready():
	text = GlobalDeckBuilder.dimensionTexts[GlobalDeckBuilder.dimension]
