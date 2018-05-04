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

	height: INTEGER
		once
				Result := 15
		end

	width: INTEGER
		once
				Result := 23
		end

	gameboard : GAMEBOARD

	make
			-- Run application.
		do
			create gameboard.constructor (height, width)
			initMap
			io.putstring (gameboard.getboardasstring)
			print ("Hello Eiffel World!%N")
		end

	initMap
		local
			walltile: WALL_TILE
			exittile: EXIT_TILE
			emptytile: EMPTY_TILE
			i:INTEGER
			j:INTEGER
		do
			from
				i:=0
			until
				i>=height
			loop

				from
					j := 0
				until
					j >= width


				loop
					create walltile
					gameboard.settile (i, j, walltile)

					j := j+1
				end

				i:=i+1
			end

			create exittile
			gameboard.settile (14, 7, exittile)


			create emptytile
			gameboard.settile (1, 1, emptytile)
			gameboard.settile (1, 2, emptytile)
			gameboard.settile (1, 3, emptytile)
			gameboard.settile (1, 4, emptytile)
			gameboard.settile (1, 5, emptytile)
			gameboard.settile (1, 6, emptytile)
			gameboard.settile (1, 7, emptytile)
			gameboard.settile (1, 9, emptytile)
			gameboard.settile (1, 10, emptytile)
			gameboard.settile (1, 11, emptytile)
			gameboard.settile (1, 12, emptytile)
			gameboard.settile (1, 13, emptytile)
			gameboard.settile (1, 14, emptytile)
			gameboard.settile (1, 15, emptytile)
			gameboard.settile (1, 16, emptytile)
			gameboard.settile (1, 17, emptytile)
			gameboard.settile (1, 18, emptytile)
			gameboard.settile (1, 19, emptytile)
			gameboard.settile (1, 21, emptytile)

			gameboard.settile (2, 1, emptytile)
			gameboard.settile (2, 5, emptytile)
			gameboard.settile (2, 9, emptytile)
			gameboard.settile (2, 15, emptytile)
			gameboard.settile (2, 19, emptytile)
			gameboard.settile (2, 21, emptytile)


			gameboard.settile (3, 1, emptytile)
			gameboard.settile (3, 2, emptytile)
			gameboard.settile (3, 3, emptytile)
			gameboard.settile (3, 5, emptytile)
			gameboard.settile (3, 6, emptytile)
			gameboard.settile (3, 7, emptytile)
			gameboard.settile (3, 8, emptytile)
			gameboard.settile (3, 9, emptytile)
			gameboard.settile (3, 10, emptytile)
			gameboard.settile (3, 11, emptytile)
			gameboard.settile (3, 12, emptytile)
			gameboard.settile (3, 13, emptytile)
			gameboard.settile (3, 15, emptytile)
			gameboard.settile (3, 17, emptytile)
			gameboard.settile (3, 19, emptytile)
			gameboard.settile (3, 21, emptytile)

			gameboard.settile (4, 3, emptytile)
			gameboard.settile (4, 11, emptytile)
			gameboard.settile (4, 15, emptytile)
			gameboard.settile (4, 17, emptytile)
			gameboard.settile (4, 19, emptytile)
			gameboard.settile (4, 21, emptytile)

			gameboard.settile (5, 1, emptytile)
			gameboard.settile (5, 2, emptytile)
			gameboard.settile (5, 3, emptytile)
			gameboard.settile (5, 5, emptytile)
			gameboard.settile (5, 6, emptytile)
			gameboard.settile (5, 7, emptytile)
			gameboard.settile (5, 9, emptytile)
			gameboard.settile (5, 10, emptytile)
			gameboard.settile (5, 11, emptytile)
			gameboard.settile (5, 13, emptytile)
			gameboard.settile (5, 14, emptytile)
			gameboard.settile (5, 15, emptytile)
			gameboard.settile (5, 17, emptytile)
			gameboard.settile (5, 19, emptytile)
			gameboard.settile (5, 21, emptytile)



			gameboard.settile (6, 3, emptytile)
			gameboard.settile (6, 5, emptytile)
			gameboard.settile (6, 7, emptytile)
			gameboard.settile (6, 13, emptytile)
			gameboard.settile (6, 17, emptytile)
			gameboard.settile (6, 19, emptytile)
			gameboard.settile (6, 21, emptytile)

			gameboard.settile (7, 1, emptytile)
			gameboard.settile (7, 3, emptytile)
			gameboard.settile (7, 5, emptytile)
			gameboard.settile (7, 7, emptytile)
			gameboard.settile (7, 8, emptytile)
			gameboard.settile (7, 9, emptytile)
			gameboard.settile (7, 10, emptytile)
			gameboard.settile (7, 11, emptytile)
			gameboard.settile (7, 12, emptytile)
			gameboard.settile (7, 13, emptytile)
			gameboard.settile (7, 15, emptytile)
			gameboard.settile (7, 16, emptytile)
			gameboard.settile (7, 17, emptytile)
			gameboard.settile (7, 18, emptytile)
			gameboard.settile (7, 19, emptytile)
			gameboard.settile (7, 21, emptytile)

			gameboard.settile (8, 1, emptytile)
			gameboard.settile (8, 5, emptytile)
			gameboard.settile (8, 15, emptytile)
			gameboard.settile (8, 21, emptytile)


			gameboard.settile (9, 1, emptytile)
			gameboard.settile (9, 3, emptytile)
			gameboard.settile (9, 4, emptytile)
			gameboard.settile (9, 5, emptytile)
			gameboard.settile (9, 7, emptytile)
			gameboard.settile (9, 8, emptytile)
			gameboard.settile (9, 9, emptytile)
			gameboard.settile (9, 10, emptytile)
			gameboard.settile (9, 11, emptytile)
			gameboard.settile (9, 13, emptytile)
			gameboard.settile (9, 15, emptytile)
			gameboard.settile (9, 16, emptytile)
			gameboard.settile (9, 17, emptytile)
			gameboard.settile (9, 18, emptytile)
			gameboard.settile (9, 19, emptytile)
			gameboard.settile (9, 21, emptytile)

			gameboard.settile (10, 1, emptytile)
			gameboard.settile (10, 3, emptytile)
			gameboard.settile (10, 7, emptytile)
			gameboard.settile (10, 9, emptytile)
			gameboard.settile (10, 11, emptytile)
			gameboard.settile (10, 13, emptytile)
			gameboard.settile (10, 19, emptytile)
			gameboard.settile (10, 21, emptytile)


			gameboard.settile (11, 1, emptytile)
			gameboard.settile (11, 3, emptytile)
			gameboard.settile (11, 4, emptytile)
			gameboard.settile (11, 5, emptytile)
			gameboard.settile (11, 7, emptytile)
			gameboard.settile (11, 9, emptytile)
			gameboard.settile (11, 11, emptytile)
			gameboard.settile (11, 12, emptytile)
			gameboard.settile (11, 13, emptytile)
			gameboard.settile (11, 15, emptytile)
			gameboard.settile (11, 16, emptytile)
			gameboard.settile (11, 17, emptytile)
			gameboard.settile (11, 19, emptytile)
			gameboard.settile (11, 21, emptytile)

			gameboard.settile (12, 1, emptytile)
			gameboard.settile (12, 5, emptytile)
			gameboard.settile (12, 7, emptytile)
			gameboard.settile (12, 9, emptytile)
			gameboard.settile (12, 15, emptytile)
			gameboard.settile (12, 17, emptytile)
			gameboard.settile (12, 19, emptytile)
			gameboard.settile (12, 21, emptytile)

			gameboard.settile (13, 1, emptytile)
			gameboard.settile (13, 2, emptytile)
			gameboard.settile (13, 3, emptytile)
			gameboard.settile (13, 4, emptytile)
			gameboard.settile (13, 5, emptytile)
			gameboard.settile (13, 7, emptytile)
			gameboard.settile (13, 9, emptytile)
			gameboard.settile (13, 10, emptytile)
			gameboard.settile (13, 11, emptytile)
			gameboard.settile (13, 12, emptytile)
			gameboard.settile (13, 13, emptytile)
			gameboard.settile (13, 14, emptytile)
			gameboard.settile (13, 15, emptytile)
			gameboard.settile (13, 17, emptytile)
			gameboard.settile (13, 18, emptytile)
			gameboard.settile (13, 19, emptytile)
			gameboard.settile (13, 20, emptytile)
			gameboard.settile (13, 21, emptytile)

		end

end
