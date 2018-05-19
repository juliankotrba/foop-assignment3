note
	description: "Summary description for {ALGORITHM_RANDOM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ALGORITHM_RANDOM

inherit
	ALGORITHM

feature
	get_next_step (currentwidth : INTEGER; currentheight : INTEGER; gameboard : GAMEBOARD; botmemory : BOTMEMORY) : STEP
		local
			step: STEP
		do
			create step.constructor (currentheight,currentwidth)
			Result := step
		end
end
