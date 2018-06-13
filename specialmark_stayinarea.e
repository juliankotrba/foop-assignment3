note
	description: "Summary description for {SPECIALMARK_STAYINAREA}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SPECIALMARK_STAYINAREA


inherit
	SPECIALMARK
	EXECUTION_ENVIRONMENT

create
	constructor

feature
	xStart: INTEGER
	yStart: INTEGER
	reachedStart: INTEGER


	is_finished : BOOLEAN
	do
		Result := false
		if (reachedStart > 2) then
			Result := true
		end
	end

	constructor (currentwidth : INTEGER; currentheight : INTEGER)
		do
			xStart := currentwidth
			yStart := currentheight
			reachedStart := 0
		end

	get_next_step (currentwidth : INTEGER; currentheight : INTEGER; gameboard : GAMEBOARD; botmemory : BOTMEMORY ) : STEP

		local
			step: STEP
			minimumDistance: INTEGER
			distance: INTEGER
		do
			if(xStart=currentwidth and yStart=currentheight) then
				reachedStart:= reachedStart + 1
			end
			minimumDistance:= 10000

			create step.constructor (currentheight,currentwidth)

			if(gameboard.get_tile (currentheight-1, currentwidth).is_walkable and not(botmemory.get_last_step=0) and not(botmemory.get_last_step=1)) then
				distance:=get_manhattan(currentheight-1,currentwidth)
				if(distance<minimumDistance) then
					minimumDistance:= distance
					create step.constructor(currentheight-1, currentwidth)
				end

			end

			if(gameboard.get_tile (currentheight+1, currentwidth).is_walkable and not(botmemory.get_last_step=2)) then
				distance:=get_manhattan(currentheight+1, currentwidth)
				if(distance<minimumDistance) then
					minimumDistance:= distance
					create step.constructor(currentheight+1, currentwidth)
				end

			end

			if(gameboard.get_tile (currentheight, currentwidth-1).is_walkable and not(botmemory.get_last_step=3)) then
				distance:=get_manhattan(currentheight, currentwidth-1)
				if(distance<minimumDistance) then
					minimumDistance:= distance
					create step.constructor(currentheight, currentwidth-1)
				end

			end

			if(gameboard.get_tile (currentheight, currentwidth+1).is_walkable and not(botmemory.get_last_step=1)) then
				distance:=get_manhattan(currentheight, currentwidth+1)
				if(distance<minimumDistance) then
					minimumDistance:= distance
					create step.constructor(currentheight, currentwidth+1)
				end

			end

			if(minimumDistance=10000) then
				if(botmemory.get_last_step=0 or botmemory.get_last_step = -1) then
					create step.constructor(currentheight-1, currentwidth)
				end
				if(botmemory.get_last_step=2) then
					create step.constructor(currentheight+1, currentwidth)
				end
				if(botmemory.get_last_step=3) then
					create step.constructor(currentheight, currentwidth-1)
				end
				if(botmemory.get_last_step=1) then
					create step.constructor(currentheight, currentwidth+1)
				end
			end


			Result := step
		end

	get_manhattan(width:INTEGER;height:INTEGER):INTEGER
		local
			x: INTEGER
			y: INTEGER
		do
			x:=width-xStart
			y:=height-yStart
			Result:=x.abs+y.abs
		end

end
