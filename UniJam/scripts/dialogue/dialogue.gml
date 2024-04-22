
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

function opening_dialogue(){
	if currentIndex == 1{ //This is the index the code is currently at
		icon=firstAntIcon_s
		getInput = 0
		optionText = [  ]
		optionGoals = [2]
		drawText = [ "Hi, I'm Eddie" ]
	}
	if currentIndex == 2{ //This is the index the code is currently at
		getInput = 1
		optionText = [ "you're a pest","hell yeah","pest?" ]
		optionGoals = [ 6,4,3 ]
		drawText = [ "You here about the ","pest control ad?" ]
	}
	if currentIndex == 3{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [12]
		drawText = [ "Bunch of humans causing","issues around here" ]
	}
	if currentIndex == 4{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [3]
		drawText = [ "Thats the spirit!" ]
	}
	if currentIndex == 5{ //This is the index the code is currently at
		firstAnt_o.spoken=true
		getInput = 1
		optionText = [ "pay?","[END]","start?","swords?" ]
		optionGoals = [ 10,13,11,8 ]
		drawText = [ "so any questions?" ]
	}
	if currentIndex == 6{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [7]
		drawText = [ "Thats no way to talk","to an employer!" ]
	}
	if currentIndex == 7{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [12]
		drawText = [ "Its humans that cause","issues normally nowadays" ]
	}
	if currentIndex == 8{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [9]
		drawText = [ "First time fighting ey?","Head over to the dummies" ]
	}
	if currentIndex == 9{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [15]
		drawText = [ "We have a private trainer","company benefit" ]
	}
	if currentIndex == 10{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [15]
		drawText = [ "You'll get paid per kill.","We pay more for close","proximity. Corporate policy" ]
	}
	if currentIndex == 11{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [15]
		drawText = [ "Hop down the hole","for the wilds- pretty","dangerous though" ]
	}
	if currentIndex == 12{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [5]
		drawText = [ "global warming etc","you get it" ]
	}
	if currentIndex == 13{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [14]
		drawText = [ "see ya" ]
	}
	if currentIndex == 14{ //This is where dialogue ends
		getInput=false
		optionText = []
		optionGoals = []
		drawText = []
		instance_destroy()
	}
	if currentIndex == 15{ //This is the index the code is currently at
		getInput = 1
		optionText = [ "[END]","start?","swords?","pay?" ]
		optionGoals = [ 13,11,8,10 ]
		drawText = [ "Anything else?" ]
	}

}

function honour_dialogue(){
	if currentIndex == 1{ //This is the index the code is currently at
		icon=heroIdleUpper_s
		getInput = 0
		optionText = [  ]
		optionGoals = [2]
		drawText = [ "I should kill enemies closer","Ghosts might spawn otherwise." ]
	}
	if currentIndex == 2{ //This is where dialogue ends
		getInput=false
		optionText = []
		optionGoals = []
		drawText = []
		instance_destroy()
	}

}