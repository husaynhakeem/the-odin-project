def bubble_sort(array)
  sorted = false

  until sorted == true
    # Before going through the array, assume it's sorted
    sorted = true

    # Go through the array, if neighboring elements are not sorted, swap them
    0.upto(array.length - 2) do |i|
      if array[i] > array[i + 1]
        temp = array[i]
        array[i] = array[i + 1]
        array[i + 1] = temp

        # Since a swap has been made, set `sorted` to false
        sorted = false
      end
    end
  end

  return array
end