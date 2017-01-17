require "nokogiri"

module AozoraPolly
  class Document
    attr_reader :title, :author, :main_text, :bibliography

    def self.parse(html)
      doc = Nokogiri::HTML.parse(html)
      title = doc.xpath('//h1').text
      author = doc.xpath('//h2').text
      main_text = doc.xpath('//div[@class="main_text"]').to_html
      bibliography = doc.xpath('//div[@class="bibliographical_information"]').to_html
      new(title, author, main_text, bibliography)
    end

    def initialize(title, author, main_text, bibliography)
      @title = title
      @author = author
      @main_text = main_text
      @bibliography = bibliography
    end
  end
end
