note
	description: "DFS algorithm implementation {ALGORITHM_DFS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ALGORITHM_DFS

inherit
	ALGORITHM
	EXECUTION_ENVIRONMENT

feature

	get_next_step (currentwidth : INTEGER; currentheight : INTEGER; gameboard : GAMEBOARD; botmemory : BOTMEMORY ) : STEP

		local
				step: STEP
				last_step: STEP
				specialstep: STEP
				specialDefault: SPECIALMARK_DEFAULT
				specialstepfound: BOOLEAN
		do

			-- Try north
			if (is_valid_direction(currentheight - 1, currentwidth, gameboard, botmemory, "N")) then
				create step.constructor (currentheight - 1, currentwidth)

			-- Try east	
			elseif (is_valid_direction(currentheight, currentwidth + 1, gameboard, botmemory, "E")) then
				create step.constructor (currentheight, currentwidth + 1)

			-- Try south	
			elseif (is_valid_direction(currentheight + 1, currentwidth, gameboard, botmemory, "S")) then
				create step.constructor (currentheight + 1, currentwidth)

			-- Try west
			elseif (is_valid_direction(currentheight, currentwidth - 1, gameboard, botmemory, "W")) then
				create step.constructor (currentheight, currentwidth - 1)

			else
				-- no further valid tile
				-- go back until we find another valid tile

				-- last step is current step
				-- so remove the last one first
				step := botmemory.go_back
				step := botmemory.go_back
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

feature {NONE}
	is_valid_direction(height: INTEGER; width: INTEGER gameboard: GAMEBOARD; mem: BOTMEMORY; dir:STRING): BOOLEAN
		local
			step: STEP
		do
			create step.constructor (height, width)

			if gameboard.get_tile (height, width).is_walkable and mem.not_visited(step) then
				Result := TRUE
			else
				Result := FALSE
			end

		end

end
