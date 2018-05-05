note
	description: "Summary description for {ANSI_HELPER}."
	author: "David Walter"
	date: "$Date$"
	revision: "$Revision$"

class
	ANSI_HELPER

create
	init

feature

	init
		do
			print ("%N")
			print("%/27/[1J")
			move(0,0)
		end

	save
		do
			print("%/27/[s")
		end

	restore
		do
			print("%/27/[u")
		end

	reset_input
		do
			restore
			print("%/27/[0K")
			restore
		end

	move (x: INTEGER; y: INTEGER)
		do
			print("%/27/[" + y.out + ";" + x.out + "H")
		end

	reset
		do
			print("%/27/[0;37;40m")
		end

	clear
		do
			reset
			move(0,11)
			print("%/27/[0J")
		end

	player(id: INTEGER)
		do
			if id = 0 then
				print("%/27/[0;31;47m")
			elseif id = 1 then
				print("%/27/[0;32;47m")
			elseif id = 2 then
				print("%/27/[0;33;47m")
			else
				reset
			end
		end

end
