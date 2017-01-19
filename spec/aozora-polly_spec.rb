require "spec_helper"

describe AozoraPolly do
  describe ".html2ssml" do
    subject { AozoraPolly.html2ssml(html) }

    context "走れメロス" do
      let(:html) { File.read(fixture_path("hashire_merosu.html"), encoding: "cp932") }

      it do
        is_expected.to include('<p>走れメロス</p>')
        is_expected.to include('<p>太宰治</p>')
        is_expected.to include('わずか答えた。<break />')
        is_expected.to include('<p>（古伝説と、シルレルの詩から。）</p>')
        is_expected.to include('じゃちぼうぎゃく')
      end
    end

    context "吾輩は猫である" do
      let(:html) { File.read(fixture_path("wagahai.html"), encoding: "cp932") }

      it do
        is_expected.to include('<p>吾輩は猫である</p>')
        is_expected.to include('<p>夏目漱石</p>')
      end
    end
  end
end
