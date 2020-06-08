def merge_sort(array)
  merge_sort_internal(array, 0, array.length - 1)
end

def merge_sort_internal(array, left, right)
  if left > right
    return []
  end

  if left == right
    return [array[left]]
  end

  middle = (left + right) / 2
  left_array = merge_sort_internal(array, left, middle)
  right_array = merge_sort_internal(array, middle + 1, right)
  merge(left_array, right_array)
end

def merge(left_array, right_array)
  merged = []
  left_index = 0
  right_index = 0

  while left_index < left_array.length && right_index < right_array.length
    if left_array[left_index] < right_array[right_index]
      merged << left_array[left_index]
      left_index += 1
    else
      merged << right_array[right_index]
      right_index += 1
    end
  end

  left_index.upto(left_array.length - 1) do |i|
    merged << left_array[i]
    end

  right_index.upto(right_array.length - 1) do |i|
    merged << right_array[i]
  end

  merged
end
