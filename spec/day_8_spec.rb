require_relative '../src/day_8'

describe Day8 do
  subject { described_class.new }

  it 'return correct part 1 result' do
    expect(subject.first_part_result('input/day_8_part1_sample.txt')).to be 21
  end

  it 'return correct part 2 result' do
    expect(subject.second_part_result('input/day_8_part1_sample.txt')).to be 8
  end
end
