require "aozora-ssml/version"
require "aozora-ssml/builder"
require "aozora-ssml/document"

module AozoraSsml
  def self.html2ssml(*args)
    builder.html2ssml(*args)
  end

  def self.builder
    @builder ||= ::AozoraSsml::Builder.new
  end
end
