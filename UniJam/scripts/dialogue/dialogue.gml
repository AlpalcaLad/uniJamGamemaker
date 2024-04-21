
function physics_dialogue(){
	if currentIndex == 1{ //This is the index the code is currently at
		icon=heroIdleUpper_s
		getInput = 0
		optionText = [  ]
		optionGoals = [2]
		drawText = [ "Hey! You nearly broke my","physics. Be more careful!" ]
	}
	if currentIndex == 2{ //This is where dialogue ends
		getInput=false
		optionText = []
		optionGoals = []
		drawText = []
		instance_destroy()
	}

}