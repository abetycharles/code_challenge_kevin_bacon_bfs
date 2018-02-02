require_relative '../queue'

describe Queue do
  before do
    @queue = Queue.new

    @queue.enqueue('item 1')
    @queue.enqueue('item 2')
    @queue.enqueue('item 3')
  end
  it "when something is added, it goes to the end" do
    @queue.enqueue('item 4')

    expect(@queue.values.last).to eq 'item 4'
  end
  it "when something is removed, it comes from the front" do
    first_item = @queue.values.first
    item = @queue.dequeue

    expect(item).to eq first_item
  end
end