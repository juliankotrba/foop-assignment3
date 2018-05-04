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

feature

	terminal: ANSI_HELPER

	debug_draw
		local
			i: INTEGER
		do
			from
				i := 1
			until
				i >= 10
			loop
				i := i + 1
				draw_coord (i,4)
				sleep (1000000000)
			end

		end

	init
		do
			create terminal.init

			print ("%/27/[0;37;46m");
			print (" ********************** %N")
			print (" *      Botracer      * %N")
			print (" ********************** %N")

			draw_players

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
			print (state.gameboard.getboardasstring)
			terminal.reset_input
			--loop draw(state.player)
		end

	draw_player (player: PLAYER)
		do
			-- ???
		end

	draw_players
		do
			terminal.reset
			print ("%N")
			print ("%/27/[0;30;41m Player 1 %N")
			print ("%/27/[0;30;42m Player 2 %N")
			print ("%/27/[0;30;43m Player 3 %N")
			print ("%N")
			terminal.reset
		end

	draw_coord(x: INTEGER; y: INTEGER)
		local
			oY: INTEGER
		do
			terminal.reset
			oY := y + 11
			print("%/27/[" + oY.out + ";" + x.out + "H");
			terminal.player (0)
			print ("P")
			terminal.reset_input
		end

end
