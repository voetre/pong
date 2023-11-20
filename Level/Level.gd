extends Node

var PlayerScore = 0
var OpponentScore = 0

func _on_WallLeft_body_entered(body):
	score_handler(0)

func _on_WallRight_body_entered(body):
	score_handler(1)

func _process(delta):
	$PlayerScore.text = "Player: " + str(PlayerScore)
	$OpponentScore.text = "Opponent: " + str(OpponentScore)
	$CountdownLabel.text = str(stepify($CountdownTimer.time_left,0.1))

func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup','restart_ball')
	$CountdownLabel.visible = false

func score_handler(who):
	$ScoreSound.play()
	$Ball.position = Vector2(640,360)
	if who == 0:
		OpponentScore += 1
	if who == 1:
		PlayerScore += 1
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$Player.position.y = 365
	$Player.position.x = 50
	$Opponent.position.y = 365
	$Opponent.position.x = 1230
