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
			specialstep: STEP
			specialDefault: SPECIALMARK_DEFAULT
			specialstepfound: BOOLEAN
		do
			create step.constructor (currentheight,currentwidth)
			Result := step
			specialstep := botmemory.get_special.get_next_step(currentwidth,currentheight, gameboard,botmemory)
			if specialstep.get_height = currentheight and specialstep.get_width = currentwidth then
			else
				specialstepfound := true
				Result := specialstep
			end
			if botmemory.get_special.is_finished then
				create specialDefault
				botmemory.set_special(specialDefault)
			end

		end
end
