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

      # make a movie node
      movie_node = Node.new(title)
      movie_node.movie = true
      cast_nodes = []

      casts.each do |cast|
        actor_node = @graph.node(cast)
        unless actor_node
          actor_node = Node.new(cast)
          # don't need to explicitly do this
          actor_node.movie = false
        end
        actor_node.add_edge(movie_node)
        movie_node.add_edge(actor_node)

        @graph.add_node(actor_node)
      end

      # add movie node to collection of all nodes
      @graph.add_node(movie_node)
    end
  end

  def bacon_number
    @graph.start = @graph.node('Rachel McAdams')
    @graph.end = @graph.node('Kevin Bacon')

    puts "start node: #{@graph.start.value}"
    puts "end node: #{@graph.end.value}"

    queue = []
    start_node = @graph.start
    end_node = @graph.end

    start_node.visited = true
    queue.push(start_node)

    while queue.length > 0 do
      current = queue.shift

      if current.value == end_node.value
        puts "Found #{current.value}"
        puts
        break
      end

      edges = current.edges
      edges.each do |neighbor|
        if neighbor.visited == false
          neighbor.visited = true
          neighbor.parent = current
          queue.push(neighbor)
        end
      end
    end

    path = []
    path.push(end_node)

    next_node = end_node.parent
    while(next_node) do
      path.push(next_node)
      next_node = next_node.parent
    end

    # print out results.
    path.reverse!.map!{|node| node.value}
    puts path.join(' --> ')



    # start_node = @graph.start
    # end_node = @graph.end
    #
    # start_node.visited = true
    # queue.push(start_node)
    #
    # while queue.length > 0 do
    #   current_node = queue.shift
    #   puts "current node: #{current_node.value}"
    #   if current_node.value == end_node.value
    #     puts "Found! #{current_node.value}"
    #     break
    #   end
    #
    #   neighbors = current_node.edges
    #   neighbors.each do |neighbor|
    #     if !neighbor.visited
    #       neighbor.visited = true
    #       neighbor.parent = current_node
    #       queue.push(neighbor)
    #     end
    #   end

    #end

    # edges = @graph.start.edges
    # pp edges
    #
    # edges.each do |edge|
    #   if edge.value == @graph.end.value
    #     puts "Found!!"
    #   else
    #     queue.push(edge)
    #   end
    # end


    # queue = Queue.new
    # start_node = @graph.start
    # end_node = @graph.end
    # queue.push(start_node)
    #
    # unless queue.empty?
    #   current_node = queue.pop
    #   puts current_node.value
    #   unless current_node.visited?
    #     neighbors = current_node.edges
    #     #pp neighbors
    #     neighbors.each do |neighbor|
    #       if neighbor.value = 'Kevin Bacon'
    #         puts "Found!"
    #         break
    #       else
    #         queue.push(neighbor)
    #         neighbor.visited = true
    #       end
    #       neighbor.parent = current_node
    #     end
    #   end
    # end

  end

  def back_track
    end_node = @graph.end
    start_node = @graph.start

    path = []
    current_node = end_node
    while current_node && (current_node.value != start_node.value) do
      path << current_node
      current_node = current_node.parent
    end
    path
  end
end


if __FILE__ == $0

  kb = KevinBacon.new
  kb.load_data
  #pp kb.graph.nodes
  #pp kb.graph.dictionary

  puts ("**************************")
  #pp kb.bacon_number('Rushita Singh')
  #kb.bacon_number
  # pp kb.back_track

  # movies, actors = kb.graph.nodes.partition {|n| n.movie?}
  # pp "*********************** Movies *************************"
  # pp movies[0].value
  # pp movies[0]

  # puts ("\n\n")
  # pp "*********************** Actors *************************"
  # pp actors

  kb.bacon_number


end