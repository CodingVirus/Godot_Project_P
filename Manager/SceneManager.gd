extends Node

func DelayChangeScene(scene, time):
	await get_tree().create_timer(time).timeout
	get_tree().change_scene_to_file(scene)

func CutSceneCnhange(scene, sceneTime, time):
	UImanager.get_node("Inventory").visible = false
	await get_tree().create_timer(time).timeout
	UImanager.get_node("FadeInOut").Play()
	SceneManager.DelayChangeScene(scene, sceneTime)
