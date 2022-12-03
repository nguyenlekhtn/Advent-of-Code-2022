require_relative '../src/day_3'

describe Day3 do
  subject { Day3.new }

  it 'returns right sum priority shared items compartments' do
    expect(subject.sum_priority_shared_items_compartments('spec/day_3_data.txt')).to be 157
  end

  it 'returns right sum of the priorities of badges' do
    expect(subject.sum_priority_badges('spec/day_3_p2_data.txt')).to be 70
  end
end
