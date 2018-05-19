note
	description: "Summary description for {STEP}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STEP

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

end
