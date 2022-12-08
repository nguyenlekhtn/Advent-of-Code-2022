require_relative './day'

class Day4 < Day
  def one_range_fully_the_other?(first_range, the_other)
    first_range.cover?(the_other) || the_other.cover?(first_range)
  end

  def ranges_overlap?(first_range, the_other)
    start_first_range = first_range
    start_second_range = the_other
    if first_range.first > the_other.first
      start_first_range = the_other
      start_second_range = first_range
    end

    start_first_range.last >= start_second_range.first
  end

  def one_range_fully_the_other?(first_range, the_other)
    first_range.cover?(the_other) || the_other.cover?(first_range)
  end

  def to_pair_assignments(string)
    string.split(',')
  end

  def to_range(string)
    arr = string.split('-').map(&:to_i)
    arr[0]..arr[1]
  end

  def number_assignment_pairs_one_fully_contain_other(pairs)
    pairs.map { |pair_string| to_pair_assignments(pair_string) }
         .map { |pair| pair.map { |assignment_str| to_range(assignment_str) } }
         .filter { |pair| one_range_fully_the_other?(*pair) }.length
  end

  def number_assignment_pairs_ranges_overlap(pairs)
    pairs.map { |pair_string| to_pair_assignments(pair_string) }
         .map { |pair| pair.map { |assignment_str| to_range(assignment_str) } }
         .filter { |pair| ranges_overlap?(*pair) }.length
  end

  def first_part_result(path)
    number_assignment_pairs_one_fully_contain_other(list(path))
  end

  def second_part_result(path)
    number_assignment_pairs_ranges_overlap(list(path))
  end
end

# check if a pair has one range fully contains the other
#
# count total pairs \

# overlap
#   first number of one range < last number of the other range
