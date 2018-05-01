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
			gameboardHeight :=height
		end

	getgameboardHeight : INTEGER
		do
			Result := gameboardHeight
		end

	constructor (height : INTEGER; width : INTEGER)
		require
			height_valid: height/=Void and then height > 0
			width_valid: width/=Void and then width > 0
		local
			i : INTEGER
			array : ARRAY[TILE]
			tile : EMPTY_TILE
		do
			create board.make_empty
			gameboardWidth := width
			gameboardHeight := height
			from
				i:=0
			until
				i>= height
			loop
				create tile
				create array.make_filled (tile , 0, width)
				board.force (array, i)
				i := i + 1
			end
		end

	setTile(height : INTEGER; width : INTEGER; tile : TILE)
		require
			height_valid: height/=Void and then height >= 0
			width_valid: width/=Void and then width >= 0
			tile_valid: tile/=Void
		local
			array : ARRAY[TILE]
		do
			array := board.at(height)
			array.enter (tile, width)
		end

	getTile(height: INTEGER; width : INTEGER) : TILE
		require
			height_valid: height/=Void and then height >= 0
			width_valid: width/=Void and then width >= 0
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
				i:=0
			until
				i>= gameboardHeight
			loop
				array := board.at(i)
				from
					j:=0
				until
					j>=gameboardWidth
				loop
					string := string+array.at(j).getSymbol
					j:=j+1
				end
				string := string + "%N"
				i:=i+1
			end

			Result :=string
		end
end
