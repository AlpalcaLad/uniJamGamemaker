
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
		drawText = [ "We have a private trainer;","company benefit" ]
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
		drawText = [ "evil mutations and magic etc","you get it" ]
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

function spider_dialogue(){
	if currentIndex == 1{ //This is the index the code is currently at
		icon=spiderIcon_s
		spider_o.sprite_index=spiderGuard_s
		getInput = 0
		optionText = [  ]
		optionGoals = [2]
		drawText = [ "EN GUARDE FIEND" ]
	}
	if currentIndex == 2{ //This is the index the code is currently at
		getInput = 1
		optionText = [ "EN GUARDE","I'm a friend!" ]
		optionGoals = [ 4,3 ]
		drawText = [ "I'm not too old","to best a human" ]
	}
	if currentIndex == 3{ //This is the index the code is currently at
		spider_o.sprite_index=spider_s
		getInput = 0
		optionText = [  ]
		optionGoals = [6]
		drawText = [ "Oh my apologies.","Im a bit jumpy" ]
	}
	if currentIndex == 4{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [5]
		drawText = [ "Pah you haven't even","beaten 100 waves yet","you are beneath me" ]
	}
	if currentIndex == 5{ //This is the index the code is currently at
		spider_o.sprite_index=spider_s
		getInput = 0
		optionText = [  ]
		optionGoals = [6]
		drawText = [ "I'll lend some pity","and teach you how","to actually be a threat" ]
	}
	if currentIndex == 6{ //This is the index the code is currently at
		getInput = 1
		spider_o.spoken=true
		optionText = [ "secret","defend","nothing","attack" ]
		optionGoals = [ 13,11,9,7 ]
		drawText = [ "What do you want to learn" ]
	}
	if currentIndex == 7{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [8]
		drawText = [ "You draw your attack blade","with LMB and hover it over","an enemy to target" ]
	}
	if currentIndex == 8{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [6]
		drawText = [ "Once targetting, attack","by holding left mouse button" ]
	}
	if currentIndex == 9{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [10]
		drawText = [ "Then off with you!","I haven't all day" ]
	}
	if currentIndex == 10{ //This is where dialogue ends
		getInput=false
		optionText = []
		optionGoals = []
		drawText = []
		instance_destroy()
	}
	if currentIndex == 11{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [12]
		drawText = [ "Draw your defence blade","with RMB. It will float around","you until sheathed" ]
	}
	if currentIndex == 12{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [6]
		drawText = [ "In this state all projectiles","will be deflected back" ]
	}
	if currentIndex == 13{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [14]
		drawText = [ "Some speak of an ancient art","of spinning ones blade" ]
	}
	if currentIndex == 14{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [6]
		drawText = [ "with middle mouse button..." ]
	}
	if currentIndex == 15{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [6]
		drawText = [ "That was a shocking performance","Have you learnt nothing?!"]
	}
	if currentIndex == 16{ //This is the index the code is currently at
		getInput = 0
		optionText = [  ]
		optionGoals = [15]
		drawText = [ "" ]
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