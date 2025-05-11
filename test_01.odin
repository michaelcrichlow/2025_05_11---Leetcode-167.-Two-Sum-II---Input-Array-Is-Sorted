package test

import "core:fmt"
print :: fmt.println

main :: proc() {
	print(twoSum([]int{2, 7, 11, 15}, 9))
	print(twoSum([]int{2, 3, 4}, 6))
	print(twoSum([]int{-1, 0}, -1))

	free_all(context.temp_allocator)
	// OUTPUT:
	// [1, 2]
	// [1, 3]
	// [1, 2]
}

twoSum :: proc(numbers: []int, target: int) -> []int {
	local_dict 	:= make(map[int]int, context.temp_allocator)
	local_array := make([dynamic]int, context.temp_allocator)

	for val, i in numbers {
		if (target - val) not_in local_dict {
			local_dict[val] = i + 1
		}
		else if (target - val) in local_dict {
			append(&local_array, local_dict[target - val])
			append(&local_array, i + 1)
		}
	}
	return local_array[:]
}
