class Node
  attr_accessor :value, :edges, :parent, :visited, :movie

  def initialize(value)
    @value = value
    @edges = []
    @parent = nil
    @visited = false
    @movie = false
  end

  def visited?
    @visited
  end

  def movie?
    @movie
  end

  def add_edge(node)
    @edges << node
  end

  # def to_s
  #   puts "#{@value}"
  # end
end