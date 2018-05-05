note
	description: "Summary description for {GAMEBOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAMEBOARD

create
	constructor

feature {NONE} -- variables
	gameboardWidth : INTEGER
	gameboardHeight : INTEGER
	board : ARRAY[ARRAY[TILE]]

feature
	setGameboardWidth(width : INTEGER)
		do
			gameboardWidth := width
		end

	getGameboardWidth : INTEGER
		do
			Result := gameboardWidth
		end

	setGameboardHeight(height : INTEGER)
		do
			gameboardHeight := height
		end

	getGameboardHeight : INTEGER
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
			initMap
		end

	setTile(height : INTEGER; width : INTEGER; tile : TILE)
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

	getTile(height: INTEGER; width : INTEGER) : TILE
		require
			height_valid: height /= Void and then height >= 0
			width_valid: width /= Void and then width >= 0
		local
			array : ARRAY[TILE]
		do
			array := board.at(height)
			Result := array.at(width)
		end

	getBoardAsString : STRING
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
					string := string + array.at(j).getSymbol
					j := j + 1
				end
				string := string + "%N"
				i := i + 1
			end

			Result := string
		end

	initMap
		-- initializes the map
		require
			getGameboardHeight() /= VOID and then getGameboardHeight() > 0
			getGameboardWidth() /= VOID and then getGameboardWidth() > 0

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
			setEmptyTilesPerRow(1, << 1,2,3,4,5,6,7,9,10,11,12,13,14,15,16,17,18,19,21 >>)
			setEmptyTilesPerRow(2, << 1,5,9,15,19,21 >>)
			setEmptyTilesPerRow(3, << 1,2,3,5,6,7,8,9,10,11,12,13,15,17,19,21 >>)
			setEmptyTilesPerRow(4, << 2,11,15,17,19,21 >>)
			setEmptyTilesPerRow(5, << 1,2,3,5,6,7,9,10,11,13,14,15,17,19,21 >>)
			setEmptyTilesPerRow(6, << 3,5,7,13,17,19,21 >>)
			setEmptyTilesPerRow(7, << 1,3,5,7,8,9,10,11,12,13,15,16,17,18,19,21 >>)
			setEmptyTilesPerRow(8, << 1,5,15,21 >>)
			setEmptyTilesPerRow(9, << 1,3,4,5,7,8,9,10,11,13,15,16,17,18,19,21 >>)
			setEmptyTilesPerRow(10, << 1,3,7,9,11,13,19,21 >>)
			setEmptyTilesPerRow(11, << 1,3,4,5,7,9,11,12,13,15,16,17,19,21 >>)
			setEmptyTilesPerRow(12, << 1,5,7,9,15,17,19,21 >>)
			setEmptyTilesPerRow(13, << 1,2,3,4,5,7,9,10,11,12,13,14,15,17,18,19,20,21 >>)

			-- set the goal with EXIT_TILE
			settile (14, 7, exittile)
		end

	setEmptyTilesPerRow(row : INTEGER; columns : ARRAY[INTEGER])
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
				settile(row, columns.item (i), emptytile)
				i := i + 1
			end
		end
end
