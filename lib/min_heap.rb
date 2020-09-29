class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # helper method to find parent
  def find_parent(index)
    return (index - 1) / 2
  end

  def left_child(index)
    return 2 * index + 1
  end

  def right_child(index)
    return 2 * index + 2
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    @store << HeapNode.new(key, value)
    heap_up(@store.length-1)
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove
    if @store.empty?
      return nil
    end
  
    swap(0, @store.length - 1)
    result = @store.pop
  
    heap_down(0) unless @store.empty?
    return result
  end

  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    raise NotImplementedError, "Method not implemented yet..."
  end

  private

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    return if index == 0
    
    parent = find_parent(index)
    if @store[parent].key > @store[index].key
      temp = @store[parent]
      @store[parent] = @store[index]
      @store[index] = temp
      heap_up(parent)
    end
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    # compare the new root with its children and swap to maintain the heap order in an operation called heap-down. The heap down operation is repeated until a leaf node is reached or no swaps are made.
    return if index >= @store.length-1

    left = left_child(index)
    right = right_child(index)
    smallest = nil

    if !@store[left] && !@store[right]
      return
    elsif !@store[left]
      smallest = right
    elsif !@store[right]
      smallest = left
    else
      smallest = (@store[left].key < @store[right].key) ? left : right
    end

    if @store[index].key > @store[smallest].key
      swap(index, smallest)
      heap_down(smallest)
    end

    # if  (right <= @store.length-1) &&@store[index].key > @store[right].key
    #   swap(index, right)
    #   heap_down(right)
    # end

    # heap_down(left)
    # heap_down(right)
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end