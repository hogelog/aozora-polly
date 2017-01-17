require "aozora_polly/version"
require "aozora_polly/builder"
require "aozora_polly/document"

module AozoraPolly
  def self.builder
    @builder ||= ::AozoraPolly::Builder.new
  end

  def self.url2ssml(*args)
    builder.url2ssml(*args)
  end

  def self.html2ssml(*args)
    builder.html2ssml(*args)
  end
end
