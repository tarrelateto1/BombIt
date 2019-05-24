extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _process(delta):
	if $TextureButton_back.is_hovered() == true:
		$TextureButton_back.grab_focus()
	pass


func _on_TextureButton_back_pressed():
	get_tree().change_scene("res://UI/Home.tscn")
	pass # replace with function body
