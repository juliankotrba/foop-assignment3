note
	description: "Summary description for {TERMINAL}."
	author: "David Walter"
	date: "$Date$"
	revision: "$Revision$"

class
	TERMINAL

create
	init

feature {NONE}

	offset: INTEGER

feature

	init (init_offset: INTEGER)
		do
			offset := init_offset
			print ("%/27/[25l")
			print ("%/27/[18h")
			print ("%/27/[1J") -- clear the console from cursor to the start of the screen
			move (0,0)
		end

	-- Save the cursor position
	save
		do
			print ("%/27/[s")
		end

	-- Restore the saved cursor position
	restore
		do
			print ("%/27/[u")
		end

	-- Reset color to White on Black
	reset_color
		do
			print ("%/27/[0;37;40m")
		end

	-- Moves the cursor to the input line and clears it
	reset_input
		do
			restore
			reset_color
			print ("%/27/[0K") -- Clears the line
		end

	-- Moves the cursor to the given coordinates
	move (x: INTEGER; y: INTEGER)
		do
			print ("%/27/[" + y.out + ";" + x.out + "H")
		end

	-- Moves the cursor to the given coordinates with the initial offset
	move_offset (x: INTEGER; y: INTEGER)
		do
			move (x + 1, y + offset)
		end

	-- Select Player color, for drawing
	player_color (id: INTEGER)
		do
			if id = 0 then
				print ("%/27/[1;30;41m")
			elseif id = 1 then
				print ("%/27/[1;30;42m")
			elseif id = 2 then
				print ("%/27/[1;30;43m")
			else
				reset_color
			end
		end

	draw_line
		do
			reset_color print ("%N")
		end

	draw_algo (s: STRING)
		do
			print("%/27/[1;35;47m" + s)
			reset_color
		end

	draw_mark (s: STRING)
		do
			print("%/27/[1;34;47m" + s)
			reset_color
		end

end
