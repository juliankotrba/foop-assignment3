note
	description: "Summary description for {ALGORITHM_TURN_LEFT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ALGORITHM_TURN_LEFT

inherit
	ALGORITHM
	EXECUTION_ENVIRONMENT


feature

	get_next_step (currentwidth : INTEGER; currentheight : INTEGER; gameboard : GAMEBOARD; botmemory : BOTMEMORY ) : STEP

		local
				step: STEP
				stepWithMemory: STEP
				specialstep: STEP
				specialDefault: SPECIALMARK_DEFAULT
				specialstepfound: BOOLEAN
		do


			create step.constructor (currentheight, currentwidth)
			--coming from left
			if (botmemory.get_last_step=0 or botmemory.get_last_step=-1) then
				if(gameboard.get_tile (currentheight, currentwidth-1).is_walkable) then
					create step.constructor(currentheight, currentwidth-1)
					if(botmemory.not_visited(step)) then
						create stepWithMemory.constructor(currentheight, currentwidth-1)
					end
				end
				if(gameboard.get_tile (currentheight+1, currentwidth).is_walkable) then
					create step.constructor(currentheight+1, currentwidth)
					if(botmemory.not_visited(step)) then
						create stepWithMemory.constructor(currentheight+1, currentwidth)
					end
				end
				if(gameboard.get_tile (currentheight, currentwidth+1).is_walkable) then
					create step.constructor(currentheight, currentwidth+1)
					if(botmemory.not_visited(step)) then
						create stepWithMemory.constructor(currentheight, currentwidth+1)
					end
				end
				if(gameboard.get_tile (currentheight-1, currentwidth).is_walkable) then
					create step.constructor(currentheight-1, currentwidth)
					if(botmemory.not_visited(step)) then
						create stepWithMemory.constructor(currentheight-1, currentwidth)
					end
				end
			end
			--coming from right
			if (botmemory.get_last_step=2) then
				if(gameboard.get_tile (currentheight, currentwidth+1).is_walkable) then
					create step.constructor(currentheight, currentwidth+1)
					if(botmemory.not_visited(step)) then
						create stepWithMemory.constructor(currentheight, currentwidth+1)
					end
				end
				if(gameboard.get_tile (currentheight-1, currentwidth).is_walkable) then
					create step.constructor(currentheight-1, currentwidth)
					if(botmemory.not_visited(step)) then
						create stepWithMemory.constructor(currentheight-1, currentwidth)
					end
				end
				if(gameboard.get_tile (currentheight, currentwidth-1).is_walkable) then
					create step.constructor(currentheight, currentwidth-1)
					if(botmemory.not_visited(step))then
						create stepWithMemory.constructor(currentheight, currentwidth-1)
					end
				end
				if(gameboard.get_tile (currentheight+1, currentwidth).is_walkable) then
					create step.constructor(currentheight+1, currentwidth)
					if botmemory.not_visited(step) then
						create stepWithMemory.constructor(currentheight+1, currentwidth)
					end
				end
			end
			--coming from bottom
			if (botmemory.get_last_step=3) then
				if(gameboard.get_tile (currentheight+1, currentwidth).is_walkable) then
					create step.constructor(currentheight+1, currentwidth)
					if botmemory.not_visited(step) then
						create stepWithMemory.constructor(currentheight+1, currentwidth)
					end
				end
				if(gameboard.get_tile (currentheight, currentwidth+1).is_walkable) then
					create step.constructor(currentheight, currentwidth+1)
					if botmemory.not_visited(step) then
						create stepWithMemory.constructor(currentheight, currentwidth+1)
					end
				end
				if(gameboard.get_tile (currentheight-1, currentwidth).is_walkable) then
					create step.constructor(currentheight-1, currentwidth)
					if botmemory.not_visited(step) then
						create stepWithMemory.constructor(currentheight-1, currentwidth)
					end
				end
				if(gameboard.get_tile (currentheight, currentwidth-1).is_walkable) then
					create step.constructor(currentheight, currentwidth-1)
					if botmemory.not_visited(step) then
						create stepWithMemory.constructor(currentheight, currentwidth-1)
					end
				end
			end
			--coming from top
			if (botmemory.get_last_step=1) then
				if(gameboard.get_tile (currentheight-1, currentwidth).is_walkable) then
					create step.constructor(currentheight-1, currentwidth)
					if botmemory.not_visited(step) then
						create stepWithMemory.constructor(currentheight-1, currentwidth)
					end
				end
				if(gameboard.get_tile (currentheight, currentwidth-1).is_walkable) then
					create step.constructor(currentheight, currentwidth-1)
					if botmemory.not_visited(step) then
						create stepWithMemory.constructor(currentheight, currentwidth-1)
					end
				end
				if(gameboard.get_tile (currentheight+1, currentwidth).is_walkable) then
					create step.constructor(currentheight+1, currentwidth)
					if botmemory.not_visited(step) then
						create stepWithMemory.constructor(currentheight+1, currentwidth)
					end
				end
				if gameboard.get_tile (currentheight, currentwidth+1).is_walkable then
					create step.constructor(currentheight, currentwidth+1)
					if botmemory.not_visited(step) then
						create stepWithMemory.constructor(currentheight, currentwidth+1)
					end
				end
			end

			if stepWithMemory /= Void then
				if currentheight = step.get_height and currentwidth < step.get_width then
					botmemory.set_last_step(0)
				end
				if currentheight < step.get_height and currentwidth = step.get_width then
					botmemory.set_last_step(1)
				end
				if currentheight = step.get_height and currentwidth > step.get_width then
					botmemory.set_last_step(2)
				end
				if currentheight > step.get_height and currentwidth = step.get_width then
					botmemory.set_last_step(3)
				end
				Result := stepWithMemory
			end
			if currentheight = step.get_height and currentwidth < step.get_width then
				botmemory.set_last_step(0)
			end
			if currentheight < step.get_height and currentwidth = step.get_width then
				botmemory.set_last_step(1)
			end
			if currentheight = step.get_height and currentwidth > step.get_width then
				botmemory.set_last_step(2)
			end
			if currentheight > step.get_height and currentwidth = step.get_width  then
				botmemory.set_last_step(3)
			end
			Result := step
			specialstep := botmemory.get_special.get_next_step(currentwidth,currentheight, gameboard,botmemory)
			if specialstep.get_height = currentheight and specialstep.get_width = currentwidth then
			else
				specialstepfound := true
				if currentheight = specialstep.get_height and currentwidth < specialstep.get_width then
					botmemory.set_last_step(0)
				end
				if currentheight < specialstep.get_height and currentwidth = specialstep.get_width then
					botmemory.set_last_step(1)
				end
				if currentheight = specialstep.get_height and currentwidth > specialstep.get_width then
					botmemory.set_last_step(2)
				end
				if currentheight > specialstep.get_height and currentwidth = specialstep.get_width  then
					botmemory.set_last_step(3)
				end
				Result := specialstep
			end
			if botmemory.get_special.is_finished then
				create specialDefault
				botmemory.set_special(specialDefault)
			end

		end
end

