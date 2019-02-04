class PageViews

  def initialize(log_file_address)
    @log_file_address = log_file_address
  end

  def get_view_count(log_file_address)

    f = File.open(log_file_address, "r")
      f.each_line do |line|
        puts line
      end
  end
end
