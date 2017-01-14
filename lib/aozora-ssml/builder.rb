require "sanitize"

module AozoraSsml
  class Builder
    def html2ssml(html)
      doc = ::AozoraSsml::Document.parse(html.encode("utf-8"))
      ssml_body = create_body_ssml(doc)
      create_ssml(doc, ssml_body)
    end

    def create_body_ssml(doc)
      Sanitize.
        fragment(doc.main_text, elements: %w(br ruby rb rp rt div h1 h2 h3 h4 h5)).
        gsub(%r(<br\s*/?>), '<break />').
        gsub(%r(<(?:h\d|div)[^>]*>), '<p>').
        gsub(%r(</(?:h\d|div)>), '</p>').
        gsub(%r(<rp>[^<]+</rp>), '')
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