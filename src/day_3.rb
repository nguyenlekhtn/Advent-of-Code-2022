require_relative './reader'
require_relative './day'

class Day4 < Day
  def to_priority(char)
    mapper = [*('a'..'z'), *('A'..'Z')].each_with_object(Hash.new(0))
                                       .with_index { |(el, hash), index| hash[el] = index + 1 }
    mapper[char]
  end

  def share_item(rucksack)
    first_half = rucksack[0...rucksack.length / 2]
    other_half = rucksack[rucksack.length / 2..]
    first_half.find { |el| other_half.include? el }
  end

  def result(path)
    Reader.lists(path).map { |rucksack| share_item(rucksack) }.map { |item| to_priority(item) }.sum
  end
end

# map a char to priority
# find the the share item in a rucksack
# convert that char to priotiy
# sumn all priority of all rucksacks
