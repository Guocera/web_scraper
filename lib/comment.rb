class Comment
  attr_reader :user_name, :user_comment


  def initialize(user_name, user_comment)
    @user_name = user_name
    @user_comment = user_comment
  end
end