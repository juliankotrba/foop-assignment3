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

			botmemory.add_step(step)
			Result := step
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
