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
			-- only for testing and styling, should be removed afterwards
			clearmemory: MARK_CLEAR_MEMORY
			moveaway: MARK_MOVE_AWAY
			stayinarea: MARK_STAY_IN_AREA
			turnleft: MARK_TURN_LEFT
			turnright: MARK_TURN_RIGHT
			algodfs: MARK_ALGO_DFS
			algoleft: MARK_ALGO_LEFT
			algorandom: MARK_ALGO_RANDOM
			algoright: MARK_ALGO_RIGHT

			ticks: INTEGER
			read_char: CHARACTER
		do
			create ui.init

			create gameboard.constructor (height, width)

			-- only for testing and styling, should be removed afterwards
			create clearmemory
			create moveaway
			create stayinarea
			create turnleft
			create turnright
			create algodfs
			create algoleft
			create algoright
			create algorandom

			gameboard.set_tile (2, 19, moveaway)
			gameboard.set_tile (1, 14, clearmemory)
			gameboard.set_tile (3, 8, stayinarea)
			gameboard.set_tile (5, 15, turnleft)
			gameboard.set_tile (7, 7, turnright)
			gameboard.set_tile (8, 15, algoleft)
			gameboard.set_tile (9, 17, algodfs)
			gameboard.set_tile (11, 21, algoright)
			gameboard.set_tile (13, 15, algorandom)

			ui.draw_map (gameboard)

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
