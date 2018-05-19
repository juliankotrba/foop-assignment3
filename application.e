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
	-- marks for user input
	mark_algo_dfs: MARK_ALGO_DFS
	mark_algo_left: MARK_ALGO_LEFT
	mark_algo_random: MARK_ALGO_RANDOM
	mark_algo_right: MARK_ALGO_RIGHT
	mark_clear_memory: MARK_CLEAR_MEMORY
	mark_move_away: MARK_MOVE_AWAY
	mark_stay_in_area: MARK_STAY_IN_AREA
	mark_turn_left: MARK_TURN_LEFT
	mark_turn_right: MARK_TURN_RIGHT

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

			player_height: INTEGER -- for testing
			player_width: INTEGER -- for testing
		do
			create gameboard.constructor (height, width)

			init_marks
			game_state := init_game_state(gameboard)
			create ui.init (game_state)
			ui.draw (game_state)

			set_non_blocking
			make_term_raw

			from
				ticks := 0
			invariant
				ticks >= 0
			until
				ticks >= 100 -- always false, due to line 74
			loop
				-- read char and process a valid input
				read_char := get_char
				place_mark_player1(game_state.gameboard, game_state.players.at (1).position_height, game_state.players.at (1).position_width, read_char)
				place_mark_player2(game_state.gameboard, game_state.players.at (2).position_height, game_state.players.at (2).position_width, read_char)
				place_mark_player3(game_state.gameboard, game_state.players.at (3).position_height, game_state.players.at (3).position_width, read_char)

				if (ticks = 10) then
				ticks := 0

					game_state.players.at (1).move (game_state.gameboard)
					game_state.players.at (2).move (game_state.gameboard)

					across
                		game_state.players as pls
            		loop
                		pls.item.move(game_state.gameboard)
            		end


					ui.draw (game_state)
				end

				ticks := ticks + 1
				sleep (1000 * 1000 * 100)
			end
		end

	init_marks
		-- initializes all mark types
		do
			create mark_algo_dfs
			create mark_algo_left
			create mark_algo_random
			create mark_algo_right
			create mark_clear_memory
			create mark_move_away
			create mark_stay_in_area
			create mark_turn_left
			create mark_turn_right
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
			algo_dfs: ALGORITHM_DFS
			game_state: GAME_STATE
		do
			create memory1.make
			create memory2.make
			create memory3.make
			create algo_random
			create algo_dfs

			create player1.constructor (0, memory1, algo_dfs)
			create player2.constructor (1, memory2, algo_dfs)
			create player3.constructor (2, memory3, algo_dfs)

			player1.set_position_height(13)
			player1.set_position_width (2)
			player2.set_position_height(1)
			player2.set_position_width (17)
			player3.set_position_height(3)
			player3.set_position_width (12)

			create game_state.constructor (board, << player1, player2, player3 >>)
			Result := game_state
		end

	place_mark_player1(board : GAMEBOARD; position_height : INTEGER; position_width : INTEGER; char : CHARACTER)
		-- checks if player1 made an input and sets the proper mark on position_height, position_width on the gameboard
		require
			height_valid: position_height >= 0
			widht_valid: position_width >= 0
		do
			inspect char
				when '1' then
					board.set_tile (position_height, position_width, mark_algo_dfs)
				when '2' then
					board.set_tile (position_height, position_width, mark_algo_left)
				when '3' then
					board.set_tile (position_height, position_width, mark_algo_random)
				when 'q' then
					board.set_tile (position_height, position_width, mark_algo_right)
				when 'w' then
					board.set_tile (position_height, position_width, mark_clear_memory)
				when 'e' then
					board.set_tile (position_height, position_width, mark_move_away)
				when 'a' then
					board.set_tile (position_height, position_width, mark_stay_in_area)
				when 's' then
					board.set_tile (position_height, position_width, mark_turn_left)
				when 'd' then
					board.set_tile (position_height, position_width, mark_turn_right)
				else
			end
		end

	place_mark_player2(board : GAMEBOARD; position_height : INTEGER; position_width : INTEGER; char : CHARACTER)
		-- checks if player2 made an input and sets the proper mark on position_height, position_width on the gameboard
		require
			height_valid: position_height >= 0
			widht_valid: position_width >= 0
		do
			inspect char
				when 'r' then
					board.set_tile (position_height, position_width, mark_algo_dfs)
				when 't' then
					board.set_tile (position_height, position_width, mark_algo_left)
				when 'z' then
					board.set_tile (position_height, position_width, mark_algo_random)
				when 'f' then
					board.set_tile (position_height, position_width, mark_algo_right)
				when 'g' then
					board.set_tile (position_height, position_width, mark_clear_memory)
				when 'h' then
					board.set_tile (position_height, position_width, mark_move_away)
				when 'v' then
					board.set_tile (position_height, position_width, mark_stay_in_area)
				when 'b' then
					board.set_tile (position_height, position_width, mark_turn_left)
				when 'n' then
					board.set_tile (position_height, position_width, mark_turn_right)
				else
			end
		end

	place_mark_player3(board : GAMEBOARD; position_height : INTEGER; position_width : INTEGER; char : CHARACTER)
		-- checks if player1 made an input and sets the proper mark on position_height, position_width on the gameboard
		require
			height_valid: position_height >= 0
			widht_valid: position_width >= 0
		do
			inspect char
				when '7' then
					board.set_tile (position_height, position_width, mark_algo_dfs)
				when '8' then
					board.set_tile (position_height, position_width, mark_algo_left)
				when '9' then
					board.set_tile (position_height, position_width, mark_algo_random)
				when 'u' then
					board.set_tile (position_height, position_width, mark_algo_right)
				when 'i' then
					board.set_tile (position_height, position_width, mark_clear_memory)
				when 'o' then
					board.set_tile (position_height, position_width, mark_move_away)
				when 'j' then
					board.set_tile (position_height, position_width, mark_stay_in_area)
				when 'k' then
					board.set_tile (position_height, position_width, mark_turn_left)
				when 'l' then
					board.set_tile (position_height, position_width, mark_turn_right)
				else
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
