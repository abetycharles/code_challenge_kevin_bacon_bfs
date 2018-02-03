class Node
  attr_accessor :value, :edges, :parent, :visited

  def initialize(value=nil)
    @value = value
    @edges = []
    @parent = nil
    @visited = false
  end

  # def to_s
  #   puts "#{@value}"
  # end
end