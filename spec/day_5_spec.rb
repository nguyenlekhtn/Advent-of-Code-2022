require_relative '../src/day_5'

describe Day5 do
  subject { described_class.new }

  it 'return correct part 1 result' do
    expect(subject.first_part_result('input/day_5_part1_sample.txt')).to eq 'CMZ'
  end

  it 'return correct part 2 result' do
    expect(subject.second_part_result('input/day_5_part1_sample.txt')).to eq 'MCD'
  end
end