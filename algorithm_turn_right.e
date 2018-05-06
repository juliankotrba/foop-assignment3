note
	description: "Summary description for {ALGORITHM_TURN_RIGHT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ALGORITHM_TURN_RIGHT

inherit
	ALGORITHM

feature
	get_next_step (currentwidth : INTEGER; currentheight : INTEGER; gameboard : GAMEBOARD; botmemory : BOTMEMORY) : STEP
		local
			step: STEP
		do
			create step
			Result := step
		end
end
