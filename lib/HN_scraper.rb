class HNScraper
  SITE_URL = "post.html"

  def self.get_page 
    @@get_page = Nokogiri::HTML(File.open(SITE_URL))
  end
end