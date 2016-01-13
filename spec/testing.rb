describe "Website" do
  before do
    @website = HNScraper::get_page
  end
  describe Post do
    before do
      @post = Post.new(@website)
    end

    context '#comments' do
      it 'returns all the comments' do
        list = @post.comments
        expect(list).to be_an Array
        expect(list[0]).to be_an String
      end
    end
  end

  describe Comment do
    
  end

end