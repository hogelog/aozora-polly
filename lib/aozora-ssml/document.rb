require "nokogiri"
require "htmlentities"

module AozoraSsml
  class Document
    attr_reader :title, :author, :main_text

    def self.parse(html)
      doc = Nokogiri::HTML.parse(html)
      title = doc.xpath('//h1').text
      author = doc.xpath('//h2').text
      main_text = doc.xpath('//div[@class="main_text"]').to_html
      new(title, author, main_text)
    end

    def initialize(title, author, main_text)
      @title = title
      @author = author
      @main_text = main_text
    end
  end
end
