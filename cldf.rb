require_relative './post'
require_relative './df-scraper'

class CLdf
  attr_accessor :post_array, :input, :on
  
  def initialize(post_array)
    @on = true
  end

  def call
    while self.on?
      puts "---------------------------------------------------------------------------"
      puts "Welcome to the Daring Fireball index"
      puts "              __               _____      ______   |\\        /\\       __ "
      puts "\\          / |     |          /          /     |   | \\      /  \\     |    "
      puts " \\        /  |__   |          |          |     |   |  \\    /    \\    |__  "
      puts "  \\  /\\  /   |     |          |          |     |   |   \\  /      \\   |  "  
      puts "   \\/  \\/    |__   |_____     \\____      \\_____/   |    \\/        \\  |__ "
      puts "---------------------------------------------------------------------------"
      puts "\n ~~~~~~~~~~Enter a command! ~~~~~~~~~~"
      puts "\n You can: \n 1. search \n 2. Help \n 3. Lookup \n 4. Exit"
        get_input
    end   
  end

  def on?
    @on    
  end

  def get_input
    self.input = gets.strip.downcase
    process_input
  end

  def process_input
    case self.input
    when "search"
      search
    when "help"
      help
    when "exit"
      exit
    when "lookup"
      lookup
    end
  end

  def search    
    puts "--------------------------"
    puts "Enter search word:"
    search_word = gets.strip.downcase
    count = 0
    Post.all.each do |post|
      if post.word_array.include?(search_word)
        puts post.title
        puts "----------------------------------"
        count += 1
      end
    end
    puts "#{count} results"
  end

  def help
    # puts "Here are a list of commands:"
    # puts "search"
    # puts "Lookup"
    # puts "Exit"
    # puts "Type 'help' to see this list again."
  end

  def exit
    puts "~~~~~~~~~~~~Adios~~~~~~~~~~~~~"
    self.on = false
  end

  def lookup
    puts "----------------------------------------------------------------"
    puts "\n ~~~~~~~~~~What post # do you want to look up?~~~~~~~~~~"
    id = gets.strip.downcase
    post = Post.find(id.to_i)
    title = post[1]
    link = post[2]
    puts "\n"
    puts "Post title == #{"title"} and link == \"#{link}\""
    visit(link)
  end

  def visit(link)
    puts "\n ~~~~~~~~~~Would you like to visit the page? (type \"Y\" for yes~~~~~~~~~~)"
    visit = gets.strip.downcase
    `open #{link}` if visit == "y" || visit == "yes"
  end

end

