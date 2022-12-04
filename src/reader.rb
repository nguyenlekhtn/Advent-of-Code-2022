module Reader
  def lists(path)
    File.open(path).readlines.map(&:chop).map(&:chars)
  end

  def list(path)
    File.open(path).readlines.map(&:chop)
  end
end
