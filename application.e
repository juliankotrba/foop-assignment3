note
	description: "FOOP2 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	height: INTEGER
		once
				Result := 15
		end

	width: INTEGER
		once
				Result := 23
		end

	gameboard : GAMEBOARD
	ui : UI

	make
		-- Run application.
		local
			ticks: INTEGER
			read_char: CHARACTER
			game_state: GAME_STATE
		do
			create ui.init
			create gameboard.constructor (height, width)
			game_state := init_game_state(gameboard)

			ui.draw (game_state)

			set_non_blocking
			make_term_raw

			from
				ticks := 0
			invariant
				ticks >= 0
			until
				ticks >= 100
			loop

				read_char := get_char
				if (read_char = 'w') then
					print(read_char)
				elseif (read_char = 'k') then
					print(read_char)
				end

				ticks := ticks + 1
				sleep (1000 * 1000 * 100)
			end
		end

	init_game_state(board : GAMEBOARD) : GAME_STATE
		-- creates 3 PLAYER and a new GAME_STATE with board and the created players
		-- returns the created GAME_STATE
		require
			bord_valid: board /= Void
		local
			player1: PLAYER
			player2: PLAYER
			player3: PLAYER
			memory1: BOTMEMORY
			memory2: BOTMEMORY
			memory3: BOTMEMORY
			algo_random: ALGORITHM_RANDOM
			game_state: GAME_STATE
		do
			create memory1
			create memory2
			create memory3
			create algo_random

			create player1.constructor (0, memory1, algo_random)
			create player2.constructor (1, memory2, algo_random)
			create player3.constructor (2, memory3, algo_random)

			player1.set_position_height(1)
			player1.set_position_width (3)
			player2.set_position_height(1)
			player2.set_position_width (17)
			player3.set_position_height(3)
			player3.set_position_width (12)

			create game_state.constructor (board, << player1, player2, player3 >>)
			Result := game_state
		end


feature {NONE}
	clear_screen
			-- Clears the console
	    external "C inline use <stdlib.h>"
	        alias "system(%"clear%");"
	    end

	set_non_blocking
		external "C inline use <fcntl.h>"
			alias "fcntl(0, F_SETFL, O_NONBLOCK);"
		end

	make_term_raw
		external "C inline use <termios.h>"
			alias "struct termios term; tcgetattr(0, &term); term.c_lflag &= ~(ICANON | ECHO); term.c_cc[VTIME] = 0; term.c_cc[VMIN] = 0; tcsetattr(0, 0, &term);"
		end

	get_char : CHARACTER
		external "C inline use <stdio.h>"
			alias "getchar()"
		end

end
