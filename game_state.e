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

	constructor(gameboard_ : GAMEBOARD; players_ : ARRAY[PLAYER])
	do
		gameboard := gameboard_
		players := players_
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
