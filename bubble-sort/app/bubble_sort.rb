module BubbleSort

  def sort(collection)
    sort_by(collection) { |left,right| right <=> left }
  end

  def sort_by(collection)
    array = collection.dup

    nothing_swapped = true
    element_index = 0

    loop do
      if last_index?(element_index, array)
        return array if nothing_swapped
        element_index = 0
        nothing_swapped = true
      end

      comparison = yield(array[element_index], array[element_index + 1])

      if comparison < 0
        swap!(array, element_index)
        nothing_swapped = false
      end

      element_index += 1
    end

    raise 'return error'
  end

  private

    def last_index?(index, array)
      index >= (array.length() -1)
    end

    def swap!(array, index)
      array[index], array[index + 1] = array[index + 1], array[index]
    end
end
