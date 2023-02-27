extends Node2D

func start_fever():
	fever()
	$Timer.start()

func end_fever():
	var music = get_node_or_null("/root/Game/mussc")
	music.playing = false
	var mussic = get_node_or_null("/root/Game/Music")
	mussic.volume_db = 0

func _on_Timer_timeout():
	if Global.feverish:
		fever()
		$Timer.start()
	else:
		end_fever()

func fever():
	var music = get_node_or_null("/root/Game/mussc")
	if music != null:
		music.play()
	var mussic = get_node_or_null("/root/Game/Music")
	if mussic != null:
		mussic.volume_db = -80
	var ball_container = get_node_or_null("/root/Game/Ball_Container")
	if ball_container != null:
		ball_container.make_ball_fever()
