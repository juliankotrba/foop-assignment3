note
	description: "Summary description for {GAMEBOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAMEBOARD

create
	constructor

feature {NONE} -- variables and private features
	gameboardWidth : INTEGER
	gameboardHeight : INTEGER
	board : ARRAY[ARRAY[TILE]]

	init_map
		-- initializes the map
		require
			get_gameboard_height() /= VOID and then get_gameboard_height() > 0
			get_gameboard_width() /= VOID and then get_gameboard_width() > 0

		local
			walltile: WALL_TILE
			exittile: EXIT_TILE
			emptytile: EMPTY_TILE
			clearmemory: MARK_CLEAR_MEMORY
			moveaway: MARK_MOVE_AWAY
			stayinarea: MARK_STAY_IN_AREA
			turnleft: MARK_TURN_LEFT
			turnright: MARK_TURN_RIGHT
			algodfs: MARK_ALGO_DFS
			algoleft: MARK_ALGO_LEFT
			algorandom: MARK_ALGO_RANDOM
			algoright: MARK_ALGO_RIGHT

			i:INTEGER
			j:INTEGER

			columns: ARRAY[INTEGER]
			array : ARRAY[TILE]
		do
			create walltile
			create exittile
			create clearmemory
			create moveaway
			create stayinarea
			create turnleft
			create turnright
			create algodfs
			create algoleft
			create algoright
			create algorandom
			create emptytile

			-- initialise the map with WALL_TILEs
			from
				i := 0
			until
				i >= gameboardHeight
			loop
				create array.make_filled (walltile , 0, gameboardWidth)
				board.force (array, i)
				i := i + 1
			end

			-- set the path with EMPTY_TILEs
			set_empty_tiles_per_row(1, << 1,2,3,4,5,6,7,9,10,11,12,13,14,15,16,17,18,19,21 >>)
			set_empty_tiles_per_row(2, << 1,5,9,15,19,21 >>)
			set_empty_tiles_per_row(3, << 1,2,3,5,6,7,8,9,10,11,12,13,15,17,19,21 >>)
			set_empty_tiles_per_row(4, << 2,11,15,17,19,21 >>)
			set_empty_tiles_per_row(5, << 1,2,3,5,6,7,9,10,11,13,14,15,17,19,21 >>)
			set_empty_tiles_per_row(6, << 3,5,7,13,17,19,21 >>)
			set_empty_tiles_per_row(7, << 1,3,5,7,8,9,10,11,12,13,15,16,17,18,19,21 >>)
			set_empty_tiles_per_row(8, << 1,5,15,21 >>)
			set_empty_tiles_per_row(9, << 1,3,4,5,7,8,9,10,11,13,15,16,17,18,19,21 >>)
			set_empty_tiles_per_row(10, << 1,3,7,9,11,13,19,21 >>)
			set_empty_tiles_per_row(11, << 1,3,4,5,7,9,11,12,13,15,16,17,19,21 >>)
			set_empty_tiles_per_row(12, << 1,5,7,9,15,17,19,21 >>)
			set_empty_tiles_per_row(13, << 1,2,3,4,5,7,9,10,11,12,13,14,15,17,18,19,20,21 >>)

			-- set the goal with EXIT_TILE
			set_tile (14, 7, exittile)
		end

	set_empty_tiles_per_row(row : INTEGER; columns : ARRAY[INTEGER])
		-- for each column in columns: sets an EMPTY_TILE on the location [row, column]
		local
			i: INTEGER
			emptytile: EMPTY_TILE
		do
			create emptytile

			from
				i := 1
			until
				i > columns.count
			loop
				set_tile(row, columns.item (i), emptytile)
				i := i + 1
			end
		end

feature
	set_gamebord_width(width : INTEGER)
		do
			gameboardWidth := width
		end

	get_gameboard_width : INTEGER
		do
			Result := gameboardWidth
		end

	set_gameboard_height(height : INTEGER)
		do
			gameboardHeight := height
		end

	get_gameboard_height : INTEGER
		do
			Result := gameboardHeight
		end

	constructor (height : INTEGER; width : INTEGER)
		require
			height_valid: height /= Void and then height > 0
			width_valid: width /= Void and then width > 0
		local

		do
			create board.make_empty
			gameboardWidth := width
			gameboardHeight := height
			init_map
		end

	set_tile(height : INTEGER; width : INTEGER; tile : TILE)
		require
			height_valid: height /= Void and then height >= 0
			width_valid: width /= Void and then width >= 0
			tile_valid: tile /= Void
		local
			array : ARRAY[TILE]
		do
			array := board.at(height)
			array.enter (tile, width)
		end

	get_tile(height: INTEGER; width : INTEGER) : TILE
		require
			height_valid: height /= Void and then height >= 0
			width_valid: width /= Void and then width >= 0
		local
			array : ARRAY[TILE]
		do
			array := board.at(height)
			Result := array.at(width)
		end

	get_board_as_string : STRING
		local
			string:STRING
			array:ARRAY[TILE]
			i: INTEGER
			j: INTEGER
		do
			string := ""
			from
				i := 0
			until
				i >= gameboardHeight
			loop
				array := board.at(i)
				from
					j := 0
				until
					j >= gameboardWidth
				loop
					string := string + array.at(j).get_symbol
					j := j + 1
				end
				string := string + "%N"
				i := i + 1
			end

			Result := string
		end
end
