require_relative 'node'

class Graph
  attr_accessor :nodes, :dictionary, :start, :end

  def initialize
    @nodes = []
    @dictionary = {}
    @start = nil
    @end = nil
  end

  def add_node(node)
    # node into array
    @nodes.push(node)

    # node into hash
    value = node.value
    @dictionary[value] = node
  end

  def node(value)
    @dictionary[value]
  end
end