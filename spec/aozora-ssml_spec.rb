require "spec_helper"

describe AozoraSsml do
  describe ".html2ssml" do
    let(:html) { File.read(fixture_path("hashire_merosu.html"), encoding: "cp932") }
    subject { AozoraSsml.html2ssml(html) }

    it do
      is_expected.to include('<p>走れメロス</p>')
      is_expected.to include('<p>太宰治</p>')
      is_expected.to include('わずか答えた。<break />')
      is_expected.to include('<p>（古伝説と、シルレルの詩から。）</p>')
      is_expected.to include('<ruby><rb>邪智暴虐</rb><rt>じゃちぼうぎゃく</rt></ruby>')
    end
  end
end
