require_relative 'node'

class Graph
  attr_accessor :nodes, :dictionary

  def initialize
    @nodes = []
    @dictionary = {}
  end

  def add_node(node)
    # node into array
    @nodes.push(node)

    # node into hash
    value = node.value
    @dictionary[value] = node
  end
end