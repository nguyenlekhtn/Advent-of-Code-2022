require_relative '../src/day_7'

describe Day7 do
  subject { described_class.new }

  it 'return correct part 1 result' do
    expect(subject.first_part_result('input/day_7_part1_sample.txt')).to be 95437
  end

  it 'return correct part 2 result' do
    expect(subject.second_part_result('input/day_7_part1_sample.txt')).to be 24933642
  end
end