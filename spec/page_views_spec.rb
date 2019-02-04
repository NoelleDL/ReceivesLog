require 'page_views'

describe PageViews do
  describe "get_view_count" do

    let (:content) { "a\nb\na" }

    it "opens file and puts each line" do
      page_views = PageViews.new(content)
      expect(File).to receive(:open).with('log_file_address', 'r') { StringIO.new(content) }
      page_views.get_view_count('log_file_address')
    end
  end
end
