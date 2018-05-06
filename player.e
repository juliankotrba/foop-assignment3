note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER

create
	constructor

feature
	botmemory : BOTMEMORY
	botalgorithm : ALGORITHM
	position_width : INTEGER
	position_height : INTEGER

	constructor(memory : BOTMEMORY;algorithm : ALGORITHM)
		require
			memory_valid : memory/=Void
			algorithm_valid : algorithm /= Void
		do
			botmemory := memory
			botalgorithm := algorithm
		end

	set_bot_memory(memory : BOTMEMORY)
		require
			memory_valid: memory /= Void
		do
			botmemory := memory
		end

	set_bot_algorithm(algorithm : ALGORITHM)
		require
			algorithm_valid: algorithm /= Void
		do
			botalgorithm := algorithm
		end

	set_position_width(width : INTEGER)
		require
			width_valid: width >= 0
		do
			position_width := width
		end

	set_position_height(height : INTEGER)
		require
			height_valid: height >= 0
		do
			position_height := height
		end
end
