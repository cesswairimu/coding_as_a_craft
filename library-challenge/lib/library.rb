FILENAME = './lib/books.yaml'
class Library
  attr_accessor :title, :due_date, :author

end
require 'yaml'
u = YAML::load(File.open(FILENAME))
puts u.first

