note
	description: "Covariant example"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	B
inherit A

feature
	foo (bar : ALGORITHM_DFS) : ALGORITHM_DFS

	local
		r: ALGORITHM_DFS
	do
		create r

		Result := r
	end


end
