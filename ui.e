note
	description: "Summary description for {UI}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	UI
inherit
	EXECUTION_ENVIRONMENT

create init

feature {NONE}

	terminal: ANSI_HELPER

feature

	init
		do
			create terminal.init (11)

			print ("%/27/[0;37;46m");
			print (" ********************** %N")
			print (" *      Botracer      * %N")
			print (" ********************** %N")

			terminal.reset_color

			print ("%N")
			print ("%/27/[0;30;41m Player 1 %N")
			print ("%/27/[0;30;42m Player 2 %N")
			print ("%/27/[0;30;43m Player 3 %N")
			print ("%N")

			terminal.reset_color
			terminal.save

			print ("%N")
		end

	draw_map (state: GAMEBOARD)
		do
			terminal.clear
			print (state.getboardasstring)
			terminal.reset_input
		end

	draw (state: GAME_STATE)
		do
			terminal.clear
			print (state.gameboard.getboardasstring) -- Draw the gameboard
			--loop draw_player(state.player) -- Draw the players
			terminal.reset_input
		end

	draw_player (player: PLAYER)
		local
			x: INTEGER
			y: INTEGER
		do
			x := 4
			y := 4

			terminal.move_offset (x, y) -- Move cursor to the player position
			terminal.player_color (0) -- Select player color
			print ("P") -- Draw player symbol
			terminal.reset_input
		end


end
