extends SceneTree

func _initialize() -> void:
	var patch_path := "/rootheart_patch_v202610250900.zip"
	for arg in OS.get_cmdline_user_args():
		if arg.begins_with("--resource-patch="):
			patch_path = arg.substr(17)
	if not ProjectSettings.load_resource_pack(patch_path):
		push_error("No se pudo cargar la actualización de Rootheart.")
		quit(1)
		return
	print("ROOTHEART_BUILD 202610250900")
	call_deferred("_start_game")

func _start_game() -> void:
	var scene_path: String = ProjectSettings.get_setting("application/run/main_scene")
	var error := change_scene_to_file(scene_path)
	if error != OK:
		push_error("No se pudo iniciar Rootheart: " + error_string(error))
		quit(1)
