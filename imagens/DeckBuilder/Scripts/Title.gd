extends Label


# Defines the text of the title label according to the selected dimension
func _ready():
	text = GlobalDeckBuilder.dimension
