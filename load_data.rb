# load the data from a json file
require 'json'

def load_data
  file = File.read('./data.json')
  data_hash = JSON.parse(file)
end