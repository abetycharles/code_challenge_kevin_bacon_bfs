require_relative '../node'

describe Node do
  before do
    @node = Node.new('item 0')

    @node1 = Node.new('item 1')
    @node2 = Node.new('item 2')
    @node3 = Node.new('item 3')

    @node.edges = [@node1, @node2, @node3]
    @node.parent = nil
    @node.visited = false
  end

  it "has a value" do
    expect(@node.value).to eq 'item 0'
  end
  it "has edges" do
    expect(@node.edges).to eq [@node1, @node2, @node3]
  end
  it "has a parent" do
    expect(@node.parent).to eq nil
  end
  it "has a visited flag" do
    expect(@node.visited).to eq false
  end
end