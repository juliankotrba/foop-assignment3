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

	set_gameboard(board : GAMEBOARD)
		require
			board_valid: board /= Void
		do
			gameboard := board
		end

	set_players(players_ : ARRAY[PLAYER])
		require
			players_valid: players_ /= Void
		do
			players := players_
		end
end
