extends Control


func _ready():
	HtmlFileExchanger.connect("image_found", self, "image_found")





func _on_ExportCard_pressed():
	var final_card = $ViewportContainer/Viewport.get_texture().get_data()
	
	final_card.flip_y()
	
	HtmlFileExchanger.save_image(final_card, $Panel/ScrollContainer/VBoxContainer/CardNameEdit.text + ".png")

func image_found(image, code):
	$ViewportContainer/Viewport/Card/CardImage.texture = image


func _on_CardNameEdit_text_changed(new_text):
	$ViewportContainer/Viewport/Card/CardName.text = new_text
