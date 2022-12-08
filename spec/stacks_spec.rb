require_relative '../src/stacks'

describe Stacks do
  subject { described_class.new }

  context 'when move 3 from first stack to last stack' do
    let(:quantity) { 3 }
    let(:first_stack) { %w[Z N D] }
    let(:last_stack) { %w[P] }
    it 'move 2 stacks correctly' do
      subject.move_between_two(quantity, first_stack, last_stack) => [moved_first_stack, moved_last_stack]
      expect(moved_first_stack).to match_array([])
      expect(moved_last_stack).to match_array(%w[P D N Z])
    end
  end
end
