class Reader
  def self.lists(path)
    File.open(path).readlines.map(&:chop).map(&:chars)
  end
end
