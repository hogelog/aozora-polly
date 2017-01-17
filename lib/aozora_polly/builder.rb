require "ssml2mp3"
require "sanitize"
require "net/http"

module AozoraPolly
  class Builder
    attr_reader :mp3_builder

    def initialize
      @mp3_builder = Ssml2mp3::Builder.new
    end

    def url2mp3(aozora_url, mp3_path)
      ssml = url2ssml(aozora_url)

      basename = File.basename(mp3_path, ".mp3")
      File.open(mp3_path, "wb") do |output|
        mp3_builder.synthesize(ssml, basename, output)
      end
    end

    def url2ssml(aozora_url)
      uri = URI.parse(aozora_url)
      html = Net::HTTP.get(uri).force_encoding("cp932")
      html2ssml(html)
    end

    def html2ssml(html)
      doc = ::AozoraPolly::Document.parse(html.encode("utf-8"))

      main_ssml = html2ssml_fragment(doc.main_text)
      bib_ssml = html2ssml_fragment(doc.bibliography)
      create_ssml(doc, main_ssml + bib_ssml)
    end

    def html2ssml_fragment(fragment)
      Sanitize.
        fragment(fragment, elements: %w(br ruby rb rp rt div h1 h2 h3 h4 h5)).
        gsub(%r(<br\s*/?>), '<break />').
        gsub(%r(<(?:h\d|div)[^>]*>), '<p>').
        gsub(%r(</(?:h\d|div)>), '</p>').
        gsub(%r(</?ruby>), '').
        gsub(%r(<rb>[^<]+</rb>), '').
        gsub(%r(<rp>[^<]+</rp>), '').
        gsub(%r(</?rt>), '')
    end

    def create_ssml(doc, ssml_body)
      <<-XML
<?xml version="1.0"?>
<speak version="1.1" xmlns="http://www.w3.org/2001/10/synthesis" xml:lang="ja">
<p>#{doc.title}</p>
<p>#{doc.author}</p>

#{ssml_body}
</speak>
      XML
    end
  end
end
