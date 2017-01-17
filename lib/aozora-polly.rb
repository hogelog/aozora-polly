require "aozora_polly/version"
require "aozora_polly/builder"
require "aozora_polly/document"

module AozoraPolly
  def self.html2ssml(*args)
    builder.html2ssml(*args)
  end

  def self.builder
    @builder ||= ::AozoraPolly::Builder.new
  end
end
