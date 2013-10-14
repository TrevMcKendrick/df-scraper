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
    Post.new_from_db(result.first)
   
    #@@posts[id-1] WORKING CODE
  end

  def self.new_from_db(row)
    post = Post.new
    post.id = row[0]
    post.title = row[1]
    post.link = row[2]
  end

end