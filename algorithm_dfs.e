note
	description: "Summary description for {ALGORITHM_DFS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ALGORITHM_DFS

inherit
	ALGORITHM

feature
	get_next_step (currentwidth : INTEGER; currentheight : INTEGER; gameboard : GAMEBOARD; botmemory : BOTMEMORY ) : STEP
		local
			step: STEP
		do
			create step
			Result := step
		end
end
