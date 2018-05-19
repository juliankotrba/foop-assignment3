note
	description: "Summary description for {STEP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STEP

inherit
	ANY
		redefine is_equal end
create
	constructor

feature
	height : INTEGER
	width : INTEGER

	constructor(sheight: INTEGER; swidth: INTEGER;)
		require
			swidth >= 0
			sheight >= 0
		do
			width := swidth
			height := sheight
		end

	get_height(): INTEGER
		do
			Result := height
		end

	get_width(): INTEGER
		do
			Result := width
		end

	is_equal(other: STEP): BOOLEAN
		do
			Result := height = other.height and width = other.width
		end

end
