extends Control

func _process(delta):
	if $TextureButton.is_hovered() == true:
		$TextureButton.grab_focus()
	pass


func _on_TextureButton_pressed():
	get_tree().change_scene("res://UI/Home.tscn")
	pass # replace with function body
