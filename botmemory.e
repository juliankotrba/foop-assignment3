note
	description: "Summary description for {BOTMEMORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOTMEMORY

inherit
	EXECUTION_ENVIRONMENT

create
	make

feature
	make
		do
			create visited.make
			visited.compare_objects
			create path.make_empty
		end

	-- returns last visited position and removes it from path stack
	go_back: STEP
		do
			Result := path.at (path.upper)
			path.remove_tail(1) -- sets upper t upper-1
		ensure
			path.count = old path.count - 1
		end

	add_step(step:STEP)
		require
			step /= Void
		do
			visited.extend (step)
			path.force(step, path.count)
		ensure
			visited.count = old visited.count + 1
			path.count = old path.count + 1
		end

	not_visited(step: STEP) : BOOLEAN
		do
			Result := not visited.has(step)
		end

	clear_memory()
		do
			visited.wipe_out
			path.clear_all
		ensure
			visited.count = 0
			path.count = 0
		end

feature {NONE}
	visited: LINKED_LIST[STEP]
	path: ARRAY[STEP]
end
