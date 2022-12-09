require_relative 'tree_grid'

class Day8
  def first_part_result(path)
    TreeGrid.new(tree_grid(path)).number_of_trees_visable
  end

  def second_part_result(path)
    TreeGrid.new(tree_grid(path)).highest_scenic_scenic_score
  end

  def tree_grid(path)
    File.open(path).readlines(chomp: true).map { |line| line.chars.map(&:to_i) }
  end

  def tree_visable?(tree_location, tree_grid)
    return true if tree_at_edge?(tree_location, tree_grid)

    tree_visable_from_top?(tree_location, tree_grid) || tre
  end
end