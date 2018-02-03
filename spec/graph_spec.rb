require_relative '../graph'

describe Graph do
  before do
    @graph = Graph.new

    @node1 = Node.new('item 1')
    @node2 = Node.new('item 2')
    @node3 = Node.new('item 3')
    @node4 = Node.new('item 4')
    @node5 = Node.new('item 5')
    @node6 = Node.new('item 6')

    # all nodes in graph
    @graph.nodes = [@node1, @node2, @node3, @node4, @node5, @node6]

    # Edges
    @node1.edges = [@node2, @node3]
    @node2.edges = [@node1, @node4]
    @node3.edges = [@node6]
    @node6.edges = [@node3]
    @node4.edges = [@node2, @node5]
    @node5.edges = [@node4]

    @hash = {
        @node1.value => @node1,
        @node2.value => @node2,
        @node3.value => @node3,
        @node4.value => @node4,
        @node5.value => @node5,
        @node6.value => @node6

    }
    @graph.dictionary = @hash
  end
  it "contains all the nodes" do
    expect(@graph.nodes).to eq [@node1, @node2, @node3, @node4, @node5, @node6]
  end

  it "hashes a node value to the node object" do
    expect(@graph.dictionary).to eq @hash

    expect(@graph.dictionary['item 1']).to eq @node1
    expect(@graph.dictionary['item 2']).to eq @node2
    expect(@graph.dictionary['item 3']).to eq @node3
    expect(@graph.dictionary['item 4']).to eq @node4
    expect(@graph.dictionary['item 5']).to eq @node5
    expect(@graph.dictionary['item 6']).to eq @node6
  end

  it "can add a node to itself" do
    node = Node.new('item 7')
    @graph.add_node(node)

    expect(@graph.nodes).to include(node)
    expect(@graph.dictionary['item 7']).to eq node
  end
end