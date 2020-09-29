require_relative "min_heap"

# This method uses a heap to sort an array.
# Time Complexity:  O(nlogn) - loops n times based on length of list, and then logn adding or removing
# Space Complexity: O(nlogn)
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