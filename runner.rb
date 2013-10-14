require_relative  './df-scraper'
require_relative './post'
require_relative './cldf'

main_index_url = "http://daringfireball.net/archive/"
scrape = Scraper.new(main_index_url)

cldf = CLdf.new(Post.all)
cldf.call