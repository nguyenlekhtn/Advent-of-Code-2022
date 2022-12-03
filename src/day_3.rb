require_relative './day'

class Day3 < Day
  def to_priority(char)
    mapper = [*('a'..'z'), *('A'..'Z')].each_with_object(Hash.new(0))
                                       .with_index { |(el, hash), index| hash[el] = index + 1 }
    mapper[char]
  end

  def find_share_item_between_two(first_rucksack, other_rucksack)
    first_rucksack.find { |el| other_rucksack.include?(el) }
  end

  def find_share_items_between_two(first_rucksack, other_rucksack)
    first_rucksack.filter { |el| other_rucksack.include?(el) }
  end

  def find_share_item_in_group(group_rucksacks)
    one_two_shared = find_share_items_between_two(group_rucksacks[0], group_rucksacks[1])
    two_three_shared = find_share_items_between_two(group_rucksacks[1], group_rucksacks[2])
    find_share_item_between_two(one_two_shared, two_three_shared)
  end

  def find_share_item_in_components(rucksack)
    first_half = rucksack[0...rucksack.length / 2]
    other_half = rucksack[rucksack.length / 2..]
    find_share_item_between_two(first_half, other_half)
  end

  def sum_priority_shared_items_compartments(path)
    lists(path).map { |rucksack| find_share_item_in_components(rucksack) }.map { |item| to_priority(item) }.sum
  end

  def sum_priority_badges(path)
    groups_of_three = []
    lists(path).each_slice(3) {  |tuple| groups_of_three.push(tuple) }
    groups_of_three.map { |group| find_share_item_in_group(group) }.map { |item| to_priority(item) }.sum
  end
end

# map a char to priority
# find the the share item in a rucksack
# convert that char to priotiy
# sumn all priority of all rucksacks
