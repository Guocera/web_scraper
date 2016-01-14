describe "Website" do
  before :all do
    @website = HNScraper::get_page
  end
  describe Post do
    before do
      @post = Post.new(@website)
    end

    context '#comments' do
      before do
        @list = @post.comments
      end

      it 'should show array of comments' do
        expect(@list).to be_an Array
      end

      it 'should show the comment' do
        expect(@list[0][:user_comment]).to be_an String
      end

      it 'should have a user' do |variable|
        expect(@list[0][:user_name]).to be_a String
      end
    end

    context '#add_comment' do
      it 'adds a comment to the user_comment' do
        num_text = @post.comments.size
        @post.add_comment('Guocera', "Hey All! I\'m the author")
        expect(@post.comments.size).to eq(num_text + 1)
      end
    end
  end

  describe Comment do
    before do
      @comment = Comment.new
    end
  end

end