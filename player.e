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
	bot_id : INTEGER
	bot_memory : BOTMEMORY
	bot_algorithm : ALGORITHM
	position_width : INTEGER
	position_height : INTEGER

	constructor(id : INTEGER; memory : BOTMEMORY; algorithm : ALGORITHM)
		require
			id_valid : id >= 0 and then id <= 3
			memory_valid : memory /= Void
			algorithm_valid : algorithm /= Void
		do
			bot_id := id
			bot_memory := memory
			bot_algorithm := algorithm
		end

	set_bot_memory(memory : BOTMEMORY)
		require
			memory_valid: memory /= Void
		do
			bot_memory := memory
		end

	set_bot_algorithm(algorithm : ALGORITHM)
		require
			algorithm_valid: algorithm /= Void
		do
			bot_algorithm := algorithm
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
