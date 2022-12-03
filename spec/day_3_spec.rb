require_relative '../src/day_3'

describe Day4 do
  subject(:day4) { Day4.new }

  it 'returns right result' do
    expect(day4.result('spec/day_3_data.txt')).to be 157
  end
end
