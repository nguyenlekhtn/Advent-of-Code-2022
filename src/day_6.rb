class Day6
  def first_part_result(path)
    line = File.open(path).readlines(chomp: true).first
    chars_processed(line)
  end

  def chars_processed(string, distinct_length = 4)
    queue = []
    string.chars.each_with_index do |char, index|
      queue.shift if queue.length == distinct_length
      queue.push(char)
      return index + 1 if queue.uniq.length == distinct_length
    end
  end

  def second_part_result(path)
    line = File.open(path).readlines(chomp: true).first
    chars_processed(line, 14)
  end
end
