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

	terminal: TERMINAL

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

			terminal.player_color (0)
			print (" Player 1 %N")
			terminal.player_color (1)
			print (" Player 2 %N")
			terminal.player_color (2)
			print (" Player 3 %N")

			terminal.reset_color
			print ("%N")
			terminal.save

			print ("%N")
		end

	draw_map (state: GAMEBOARD)
		do
			terminal.clear
			print (state.get_board_as_string)
			terminal.reset_input
		end

	draw (state: GAME_STATE)
		do
			terminal.clear
			print (state.gameboard.get_board_as_string) -- Draw the gameboard
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
