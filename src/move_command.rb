class MoveCommand
  attr_reader :stacks, :quantity, :from_index, :to_index

  def initialize(**opts)
    @quantity = opts[:quantity]
    @from_index = opts[:from_index]
    @to_index = opts[:to_index]
  end

  def move(stacks)
    moved_from_stack, moved_to_stack = move_between_two(quantity, stacks[from_index], stacks[to_index])
    stacks.map.each_with_index do |stack, index|
      next moved_from_stack if index == from_index
      next moved_to_stack if index == to_index
      
      stack
    end
  end

  def move_9001(stacks)
    moved_from_stack, moved_to_stack = move_between_two_9001(quantity, stacks[from_index], stacks[to_index])
    stacks.map.each_with_index do |stack, index|
      next moved_from_stack if index == from_index
      next moved_to_stack if index == to_index
      
      stack
    end
  end


  private def move_between_two(quantity, from_stack, to_stack)
    moved_from_stack = from_stack.slice(0...-quantity)
    moved_crates = from_stack.slice(-quantity..-1).reverse
    moved_to_stack = to_stack + moved_crates

    [moved_from_stack, moved_to_stack]
  end

  private def move_between_two_9001(quantity, from_stack, to_stack)
    moved_from_stack = from_stack.slice(0...-quantity)
    moved_crates = from_stack.slice(-quantity..-1)
    moved_to_stack = to_stack + moved_crates

    [moved_from_stack, moved_to_stack]
  end
end