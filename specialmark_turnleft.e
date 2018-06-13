note
	description: "Summary description for {SPECIALMARK_TURNLEFT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SPECIALMARK_TURNLEFT

inherit
	SPECIALMARK
	EXECUTION_ENVIRONMENT

	

feature

	is_finished : BOOLEAN
	do
		Result := true
	end


	get_next_step (currentwidth : INTEGER; currentheight : INTEGER; gameboard : GAMEBOARD; botmemory : BOTMEMORY ) : STEP

		local
			step: STEP
		do
			create step.constructor (currentheight,currentwidth)
			if (botmemory.get_last_step=0 or botmemory.get_last_step=-1) then
				if(gameboard.get_tile (currentheight-1, currentwidth).is_walkable) then
					create step.constructor(currentheight-1, currentwidth)
				end
			end
			if (botmemory.get_last_step=2) then
				if(gameboard.get_tile (currentheight+1, currentwidth).is_walkable) then
					create step.constructor(currentheight+1, currentwidth)
				end
			end
			if (botmemory.get_last_step=3) then
				if(gameboard.get_tile (currentheight, currentwidth-1).is_walkable) then
					create step.constructor(currentheight, currentwidth-1)
				end
			end
			if (botmemory.get_last_step=1) then
				if(gameboard.get_tile (currentheight, currentwidth+1).is_walkable) then
					create step.constructor(currentheight, currentwidth+1)
				end
			end

			Result := step
		end


end
