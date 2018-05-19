note
	description: "Summary description for {BOTMEMORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOTMEMORY

create
	make

feature
	make
		do
			create visited.make
			create path.make_empty
		end

	-- returns last visited position and removes it from path stack
	go_back: STEP
		do
			Result := path.at (path.upper)
			path.remove_tail(1) -- sets upper t upper-1
		end

	add_step(step:STEP)
		do
			visited.extend(step)
			path.force(step, path.count)
		end

	not_visited(step: STEP) : BOOLEAN
		do
			Result := not visited.has(step)
		end

feature {NONE}
	visited: LINKED_LIST[STEP]
	path: ARRAY[STEP]


end
