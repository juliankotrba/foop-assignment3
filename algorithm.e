note
	description: "Summary description for {ALGORITHM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ALGORITHM
feature
	get_next_step (currentwidth : INTEGER; currentheight : INTEGER; gameboard : GAMEBOARD; botmemory : BOTMEMORY) : STEP
		deferred
	end

end
