class PageViews

  attr_accessor :stats

  def initialize(log_file_address)
    @log_file_address = log_file_address
    @stats = stats
  end

  def get_view_count(log_file_address)
    stats = {}

    f = File.open(log_file_address, "r")
      f.each_line do |line|
        address = line.match("^\/.* ").to_s.strip.split('/')[1];
        if stats[address] == nil
          stats[address] = 1
        else
          stats[address] += 1
        end
      end
      stats
  end

  def descending_order(stats)
    sorted_stats = stats.sort_by { | k , v | v }.reverse
      sorted_stats.each do |key, value|
        puts "Page: #{key}, views: #{value}"
      end
  end
end

  #run_file = PageViews.new('./webserver.log')
  #stats = run_file.get_view_count('./webserver.log')
  #run_file.descending_order(stats)
