require 'nokogiri'
require 'pry'

class Post
  attr_reader :website

  def initialize(website)
    @website = website
    @comments = []
  end

  def comments
    website.css("[class = 'comment']").each do |comment|
      @comments << comment.text.match(/[^\\n\s][\w\s,.'\-\(\):\\\/?!<>\[\]#"]*[^\\n\s]/)[0]
    end
    @comments
  end

end

# website = Nokogiri::HTML(File.open('post.html'))
# post = Post.new(website)
# pp post.comments