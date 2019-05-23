extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
#	pass

func _process(delta):
	if $TextureButton.is_hovered() == true:
		$TextureButton.grab_focus()
	pass

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Main.tscn")
	pass # replace with function body


func _on_TextureButton2_pressed():
	get_tree().change_scene("res://UI/power_up.tscn")
	pass # replace with function body


func _on_TextureButton3_pressed():
	get_tree().change_scene("res://UI/howto.tscn")
	pass # replace with function body
