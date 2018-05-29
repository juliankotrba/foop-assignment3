note
	description: "Summary description for {SPECIALMARK_DEFAULT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SPECIALMARK_DEFAULT

inherit
	SPECIALMARK
	EXECUTION_ENVIRONMENT

feature

	is_finished : BOOLEAN
	do
		Result := false
	end


	get_next_step (currentwidth : INTEGER; currentheight : INTEGER; gameboard : GAMEBOARD; botmemory : BOTMEMORY ) : STEP

		local
			step: STEP
		do
			create step.constructor (currentheight,currentwidth)
			Result := step
		end


end

