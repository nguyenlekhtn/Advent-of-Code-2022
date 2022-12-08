require_relative '../src/day_6'

describe Day6 do
  describe

  it 'returns correctgly results from input' do
    expect(subject.chars_processed('mjqjpqmgbljsphdztnvjfqwrcgsmlb')).to be 7
    expect(subject.chars_processed('bvwbjplbgvbhsrlpgdmjqwftvncz')).to be 5
    expect(subject.chars_processed('nppdvjthqldpwncqszvftbrmjlhg')).to be 6
    expect(subject.chars_processed('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw')).to be 11
  end

  it 'returns correctgly first part result' do
    expect(subject.first_part_result('input/day_6_part1_sample.txt')).to be 11
  end

  it 'returns correctgly star-of-message position' do
    expect(subject.chars_processed('mjqjpqmgbljsphdztnvjfqwrcgsmlb', 14)).to be 19
    expect(subject.chars_processed('bvwbjplbgvbhsrlpgdmjqwftvncz', 14)).to be 23
    expect(subject.chars_processed('nppdvjthqldpwncqszvftbrmjlhg', 14)).to be 23
    expect(subject.chars_processed('nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg', 14)).to be 29
    expect(subject.chars_processed('zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw', 14)).to be 26
  end
end
