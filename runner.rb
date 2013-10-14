require_relative  './df-scraper'
require_relative './post'
require_relative './cldf'
require_relative './database'


main_index_url = "http://daringfireball.net/archive/"
scraper = Scraper.new(main_index_url)
database = Database.new

cldf = CLdf.new(Post.all)
cldf.call