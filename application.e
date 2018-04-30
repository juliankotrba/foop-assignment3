note
	description: "FOOP2 application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization

	gameboard : GAMEBOARD

	make
			-- Run application.
		local
			walltile: WALL_TILE
		do
			create gameboard.constructor (10, 10)
			initMap
			io.putstring (gameboard.getboardasstring)
			print ("Hello Eiffel World!%N")
		end

	initMap
		local
			walltile: WALL_TILE
			i:INTEGER
		do
			from
				i:=0
			until
				i>=10
			loop
				create walltile
				gameboard.settile (0, i, walltile)
				create walltile
				gameboard.settile (9, i, walltile)
				create walltile
				gameboard.settile (i, 0, walltile)
				create walltile
				gameboard.settile (i, 9, walltile)
				i:=i+1
			end
		end


end
