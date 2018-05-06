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

	draw_player (player: PLAYER)
		do
			terminal.move_offset (player.position_width, player.position_height) -- Move cursor to the player position
			terminal.player_color (player.bot_id) -- Select player color
			print ("P") -- Draw player symbol
			terminal.reset_input
		end

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

	draw (state: GAME_STATE)
		do
			-- terminal.clear
			terminal.move_offset (0, 0)
			print (state.gameboard.out) -- Draw the gameboard
			across state.players as player loop draw_player(player.item) end -- Draw the players
			terminal.reset_input
		end

end
