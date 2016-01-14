require 'nokogiri'
require 'pry'

class Post
  attr_reader :comments, :website, :user_comment, :users

  def initialize(website)
    @website = website
    initialize_comments
  end

  def initialize_comments
    @comments = Array.new
    initialize_users
    initialize_text
    (0...@users.size).each do |i|
      comment = Comment.new(@users[i], @user_comment[i])
      @comments[i] = comment.user_name.merge(comment.user_comment)
    end
  end

  def initialize_users
    @users = []
    @website.css("td[class = 'default'] div span[class = 'comhead'] > a").each do |user|
      @users << { user_name: user.content }
    end
  end

  def initialize_text
    @user_comment = []
    @website.css("[class = 'comment']").each do |comment|
      @user_comment << { user_comment: comment.content.match(/[^\\n\s].*[^\\n\s*-]/)[0] }
    end
  end

  def add_comment(user_name, text)
    comment = Comment.new(user_name, text)
    comments << { user_name: comment.user_name, user_comment: comment.user_comment }
  end

end

# website = Nokogiri::HTML(File.open('post.html'))
# post = Post.new(website)
# pp post.user_comment

#hnmain > tbody > tr:nth-child(3) > td > table.comment-tree > tbody > tr:nth-child(3) > td > table > tbody > tr > td.default > div > span > a
#hnmain > tbody > tr:nth-child(3) > td > table.comment-tree > tbody > tr:nth-child(1) > td > table > tbody > tr > td.default > div > span > a