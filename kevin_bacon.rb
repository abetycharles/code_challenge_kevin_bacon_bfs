require 'json'
require 'pp'
require_relative 'graph'

class KevinBacon
  attr_reader :graph

  def initialize
    @graph = Graph.new
  end

  def load_data
    file = File.read('./data.json')
    data_hash = JSON.parse(file)
    data_hash['movies'].each do |movie|
      title = movie['title']
      casts = movie['cast']

      cast_nodes = []
      casts.each do |cast|
        cast_node = Node.new(cast)
        cast_nodes.push(cast_node)

        @graph.nodes.push(cast_node)
        @graph.dictionary[cast] = cast_node
      end

      # make a movie node
      movie_node = Node.new(title)
      movie_node.edges = cast_nodes
      # add movie node to collection of all nodes
      @graph.nodes.push(movie_node)
      @graph.dictionary[movie_node.value] = movie_node
    end
  end
end


if __FILE__ == $0

  kb = KevinBacon.new
  kb.load_data
  pp kb.graph.nodes
  pp kb.graph.dictionary
end