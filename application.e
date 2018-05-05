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

			gameboard.settile (2, 19, moveaway)
			gameboard.settile (1, 14, clearmemory)
			gameboard.settile (3, 8, stayinarea)
			gameboard.settile (5, 15, turnleft)
			gameboard.settile (7, 7, turnright)
			gameboard.settile (8, 15, algoleft)
			gameboard.settile (9, 17, algodfs)
			gameboard.settile (11, 21, algoright)
			gameboard.settile (13, 15, algorandom)

			ui.draw_map (gameboard)
		end
end
