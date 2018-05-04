note
	description: "Summary description for {GAME_STATE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME_STATE

create
	constructor

feature
	gameboard: GAMEBOARD
	players: ARRAY[PLAYER]

	constructor(gameboardd : GAMEBOARD; playerss : ARRAY[PLAYER])
	do
		gameboard := gameboardd
		players := playerss
	end
	
end
