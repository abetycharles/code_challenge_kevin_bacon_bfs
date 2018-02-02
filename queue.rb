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