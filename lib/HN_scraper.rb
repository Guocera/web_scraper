require 'open-uri'
require 'nokogiri'
require 'pry'

class HNScraper
  SITE_URL = "https://news.ycombinator.com/item?id=7663775"

  def self.get_page 
    @@get_page = Nokogiri::HTML(open(SITE_URL))
  end
end