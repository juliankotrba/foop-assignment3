note
	description: "Summary description for {SPECIALMARK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SPECIALMARK

feature
	is_finished : BOOLEAN
		deferred
	end

	get_next_step (currentwidth : INTEGER; currentheight : INTEGER; gameboard : GAMEBOARD; botmemory : BOTMEMORY) : STEP
		require
				currentwidth <= gameboard.get_gameboard_width
				currentwidth >= 0
				currentheight <= gameboard.get_gameboard_height
				currentheight >= 0
				botmemory /= Void
				gameboard /= Void
		deferred
	end

end
