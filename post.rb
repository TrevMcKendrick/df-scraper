require 'sqlite3'

class Post
  attr_accessor :title, :link
  attr_reader :id
  
  @@posts = []
  @@db = SQLite3::Database.new 'posts.db'

  def initialize
    @@posts << self
    @id = @@posts.count
  end

  def self.all
    @@posts
  end

  def self.find(id)
    sql = "SELECT * FROM posts WHERE id = ?"
    result = @@db.execute(sql, id)
    result.flatten
  end
end

# Import all posts
# for each post, database checks whether that object has already been inserted
# if it's already inserted, it runs update
# if it's not already inserted, it runs insert