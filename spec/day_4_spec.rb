require_relative '../src/day_4'

describe Day4 do
  subject { Day4.new }

  it 'returns correct result of part 1' do
    expect(subject.first_part_result('input/day_4_sample.txt')).to be 2
  end

  it 'returns correct result of part 2' do
    expect(subject.second_part_result('input/day_4_sample.txt')).to be 4
  end
end
