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
	getNextStep (currentwidth: INTEGER; currentheight: INTEGER; gameboard: GAMEBOARD; botmemory: BOTMEMORY ) : STEP
		local
			step: STEP
		do
			create step
			Result := step
		end
end
