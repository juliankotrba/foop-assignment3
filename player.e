note
	description: "Summary description for {PLAYER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PLAYER

create
	constructor

feature {NONE} -- variables
	botmemory : BOTMEMORY
	botalgorithm : ALGORITHM

feature
	set_bot_memory(memory : BOTMEMORY)
		require
			memory_valid: memory/=Void
		do
			botmemory := memory
		end

	get_bot_memory : BOTMEMORY
		do
			Result := botmemory
		end

	constructor(memory : BOTMEMORY;algorithm : ALGORITHM)
		require
			memory_valid : memory/=Void
			algorithm_valid : algorithm /= Void
		do
			botmemory := memory
			botalgorithm := algorithm
		end

end
