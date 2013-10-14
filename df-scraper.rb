require 'nokogiri'
require 'open-uri'
require 'pry'
require 'sqlite3'
require_relative './post'

class Scraper
  attr_accessor :main_index_url, :posts_array, :saved

  def initialize(main_index_url)
    @main_index_url = main_index_url
    self.posts_array = []
    call
  end

  def call
    index_page = Nokogiri::HTML(open("#{self.main_index_url}"))
    posts = index_page.css('div.archive p a')
    count = 0
    everything = posts.collect do |a_post|
      
      new_post = Post.new
      new_post.title = a_post.text
      new_post.link = a_post['href']
      new_post.text = parse_post(new_post.link)
      new_post.word_array = new_post.title.downcase.split(' ')
      self.posts_array << new_post
      count += 1
      puts "We're on post ##{count} of 1010."
      puts Time.now
    end 
  end

  def parse_post(url)
    post_page = Nokogiri::HTML(open("#{url}"))
    post = post_page.css('div.article').text
    post.gsub!("\n\n\n",' ')
    post.gsub!("\n\n",' ')
    post.gsub!("\n",' ')
    post.gsub!("\n",' ')
    post.gsub!("  ",' ')
    post.strip
  end
end

# scraper = Scraper.new("http://daringfireball.net/archive/")
# scraper.parse_post