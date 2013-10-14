require 'nokogiri'
require 'open-uri'
require 'pry'
require 'sqlite3'
require_relative './post'

class Scraper
  attr_accessor :main_index_url, :posts_array

  @@db = SQLite3::Database.new 'posts.db'

  def initialize(main_index_url)
    @main_index_url = main_index_url
    self.posts_array = []
    call
  end

  def call
    index_page = Nokogiri::HTML(open("#{self.main_index_url}"))
    posts = index_page.css('div.archive p a') 
    
      #WORKING CODE
      # everything = posts.collect do |a_post|
      #   new_post = Post.new
      #   new_post.title = a_post.text
      #   new_post.link = a_post['href']
      #   self.posts_array << new_post
      # end

  end

end