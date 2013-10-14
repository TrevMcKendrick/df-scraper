require_relative  './df-scraper'
require_relative './post'
require_relative './cldf'
require_relative './database'


main_index_url = "http://daringfireball.net/archive/"
scrape = Scraper.new(main_index_url)
database = Database.new #(scrape)

cldf = CLdf.new(Post.all)
cldf.call

#import scrape.post_array into database
#save student at end of import
#when save, if already exists update, if not create it with insert