require_relative '../kevin_bacon'

describe KevinBacon do
  before do
    @kevin_bacon = KevinBacon.new
  end

  it "has a graph attribute" do
    expect(@kevin_bacon).to respond_to(:graph)
  end

  context "when data file is loaded" do
    before do
      @kevin_bacon.load_data
    end

    it "contains a movie nodes in data file" do
      movie_node = Node.new('Diner')

      expect(@kevin_bacon.graph.dictionary[movie_node.value].value).to eq 'Diner'
    end
    it "contains cast nodes in data file" do
      cast_node = Node.new('Lori Singer')

      expect(@kevin_bacon.graph.dictionary[cast_node.value].value).to eq 'Lori Singer'
    end
  end


end