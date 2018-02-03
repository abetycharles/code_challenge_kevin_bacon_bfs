class Queue
  attr_reader :values

  def initialize
    @values = []
  end

  def enqueue(item)
    @values << item
  end
  def dequeue
    @values.shift
  end
end


if __FILE__ == $0
  queue = Queue.new
  queue.enqueue('item 1')
  queue.enqueue('item 2')
  queue.enqueue('item 3')
  queue.enqueue('item 4')

  puts queue.values

  puts queue.dequeue

end