class Stacks
  attr_reader :stacks

  def initialize(*stacks)
    @stacks = stacks
  end

  def move(quantity, from_index, to_index)
    moved_from_stack, moved_to_stack = move_between_two(quantity, stacks[from_index], stacks[to_index])
    moved_stacks = stacks.map.each_with_index do |stack, index|
      return moved_from_stack if index == from_index
      return moved_to_stack if index == to_index
      
      stack
    end
    self.class.new(*moved_stacks)
  end


  def move_between_two(quantity, from_stack, to_stack)
    moved_from_stack = from_stack.slice(0...-quantity)
    moved_crates = from_stack.slice(-quantity..-1).reverse
    moved_to_stack = to_stack + moved_crates

    [moved_from_stack, moved_to_stack]
  end
end