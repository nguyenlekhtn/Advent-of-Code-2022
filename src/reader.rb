module Reader
  def lists(path)
    list(path).map(&:chars)
  end

  def list(path)
    File.open(path).readlines(chomp: true)
  end
end
