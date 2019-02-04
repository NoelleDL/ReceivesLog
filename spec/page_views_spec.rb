require 'page_views'

describe PageViews do

  describe "get_view_count" do

    let (:content) { "/a \n/b \n/a " }
    let (:result) {{ "b"=>1, "a"=>2 }}


    it "opens file and puts each line" do
      page_views = PageViews.new(content)
      expect(File).to receive(:open).with('log_file_address', 'r') { StringIO.new(content) }
      page_views.get_view_count('log_file_address')
    end

    it "sorts file and returns hash" do
      page_views = PageViews.new(content)
      expect(File).to receive(:open).with('log_file_address', 'r') { StringIO.new(content) }
      expect(page_views.get_view_count('log_file_address')).to eq(result)
    end
  end

  describe "descending_order" do
    let (:content) { "/a \n/c \n/a \n/a \n/c \n/a \n/b " }
    #let (:stats) {{ "b"=>1, "a"=>4, "c"=>2 }}
    let (:result) {{ "a"=>4, "c"=>2, "b"=>1 }}

    it "displays page views in decending order" do
      page_views = PageViews.new(content)
      expect(File).to receive(:open).with('log_file_address', 'r') { StringIO.new(content) }
      stats = page_views.get_view_count('log_file_address')
      expect(page_views.descending_order(stats)).to eq(result)
    end
  end

  end
