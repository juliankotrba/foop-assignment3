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
		local
			defaultmark: SPECIALMARK_DEFAULT
		do
			create visited.make
			visited.compare_objects
			create path.make_empty
			create defaultmark
			special := defaultmark
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

	set_last_step(int: INTEGER)
		do
			lastdirection := int
		ensure
			lastdirection < 4
			lastdirection > -2
		end

	get_last_step: INTEGER
		do
			Result := lastdirection
		end

	clear_memory()
		do
			visited.wipe_out
			path.clear_all
			lastdirection := -1
		ensure
			visited.count = 0
			path.count = 0
		end

	get_special: SPECIALMARK
		do
			Result := special
		end

	set_special(specialmark: SPECIALMARK)
		do
			special := specialmark
		end
feature {NONE}
	visited: LINKED_LIST[STEP]
	path: ARRAY[STEP]
	lastdirection: INTEGER
	special: SPECIALMARK
end
