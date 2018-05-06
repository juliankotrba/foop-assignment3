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

	draw_legend
		do
			print ("%/27/[0;37;46m *       Marks       * %N");
			terminal.draw_algo (" 1 ") print (" Algorithm DFS%N")
			terminal.draw_algo (" 2 ") print (" Algorithm Left%N")
			terminal.draw_algo (" 3 ") print (" Algorithm Random%N")
			terminal.draw_algo (" 4 ") print (" Algorithm Right%N")
			terminal.draw_mark (" C ") print (" Clear Memory%N")
			terminal.draw_mark (" M ") print (" Move away%N")
			terminal.draw_mark (" S ") print (" Stay in Area%N")
			terminal.draw_mark (" L ") print (" Turn Left%N")
			terminal.draw_mark (" R ") print (" Turn Right%N")
		end

feature

	init (state: GAME_STATE)
		do
			create terminal.init (5)

			print ("%/27/[0;37;46m");
			print (" ********************* %N")
			print (" *  Eiffel-Botracer  * %N")
			print (" ********************* %N")

			terminal.draw_line
			print (state.gameboard.out) -- Draw the gameboard
			terminal.draw_line

			print (" Commands | ")
			terminal.draw_algo (" 1 ") print (" | ")
			terminal.draw_algo (" 2 ") print (" | ")
			terminal.draw_algo (" 3 ") print (" | ")
			terminal.draw_algo (" 4 ") print (" | ")
			terminal.draw_mark (" C ") print (" | ")
			terminal.draw_mark (" M ") print (" | ")
			terminal.draw_mark (" S ") print (" | ")
			terminal.draw_mark (" L ") print (" | ")
			terminal.draw_mark (" R ") print (" | ")
			terminal.draw_line
			terminal.player_color (0)
			print (" Player 1 |  1  |  2  |  3  |  Q  |  W  |  E  |  A  |  S  |  D  |%N")
			terminal.player_color (1)
			print (" Player 2 |  R  |  T  |  Z  |  F  |  G  |  H  |  V  |  B  |  N  |%N")
			terminal.player_color (2)
			print (" Player 3 |  7  |  8  |  9  |  U  |  I  |  O  |  J  |  K  |  L  |%N")

			terminal.draw_line

			draw_legend

			terminal.draw_line

			terminal.save
		end

	draw (state: GAME_STATE)
		do
			terminal.move_offset (0, 0)
			print (state.gameboard.out) -- Draw the gameboard
			across state.players as player loop draw_player(player.item) end -- Draw the players

			terminal.reset_input
		end

end
