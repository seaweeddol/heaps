require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
# With an array of n elements, to perform Heapsort you can add the elements to the heap, an O(nlog n) operation. Then you can remove the elements from the heap one-by-one placing them in the proper place in an array, also an O(nlog n) operation.

def heapsort(list)
  return list if list.length <= 1

  heap = MinHeap.new

  list.each do |i|
    heap.add(i)
  end

  ordered_list = []
  list.length.times do |i|
    ordered_list << heap.remove.value
  end

  return ordered_list
end