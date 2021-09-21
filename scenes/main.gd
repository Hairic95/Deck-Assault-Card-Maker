extends Control


func _ready():
	HtmlFileExchanger.connect("image_found", self, "image_found")
	
	$Panel/ScrollContainer/VBoxContainer/CardTypeEdit.add_item("Creature")
	$Panel/ScrollContainer/VBoxContainer/CardTypeEdit.add_item("Artefact")
	$Panel/ScrollContainer/VBoxContainer/CardTypeEdit.add_item("Aid")

func _on_ExportCard_pressed():
	var final_card = $ViewportContainer/Viewport.get_texture().get_data()
	
	final_card.flip_y()
	
	HtmlFileExchanger.save_image(final_card, $Panel/ScrollContainer/VBoxContainer/CardNameEdit.text + ".png")

func image_found(image, code):
	var imgTexture = ImageTexture.new()
	imgTexture.create_from_image(image)
	
	$ViewportContainer/Viewport/Card/CardImage.texture = imgTexture


func _on_CardNameEdit_text_changed(new_text):
	$ViewportContainer/Viewport/Card/CardName.text = new_text


func _on_CardCostEdit_value_changed(value):
	$ViewportContainer/Viewport/Card/CardCost.text = str(value)


func _on_CardTypeEdit_item_selected(index):
	if index == 0:
		$ViewportContainer/Viewport/Card/CardType.text = "Creature Card"
		$ViewportContainer/Viewport/Card/CardStats.show()
	elif index == 1:
		$ViewportContainer/Viewport/Card/CardType.text = "Artefact Card"
		$ViewportContainer/Viewport/Card/CardStats.hide()
	else:
		$ViewportContainer/Viewport/Card/CardType.text = "Aid Card"
		$ViewportContainer/Viewport/Card/CardStats.hide()


func _on_CardTextEdit_text_changed():
	$ViewportContainer/Viewport/Card/CardText.text = $Panel/ScrollContainer/VBoxContainer/CardTextEdit.text


func _on_Reset_pressed():
	get_tree().reload_current_scene()


func _on_CardStats_changed(value):
	var atk = $Panel/ScrollContainer/VBoxContainer/CardAttackEdit.value
	var def = $Panel/ScrollContainer/VBoxContainer/CardDefenseEdit.value
	
	$ViewportContainer/Viewport/Card/CardStats.text = str (atk, "/", def)


func _on_Color_pressed(color):
	$ViewportContainer/Viewport/Card.change_color(color)


func _on_ImageUpload_pressed():
	HtmlFileExchanger.load_image("main_image")
