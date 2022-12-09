class TreeGrid
  attr_reader :grid

  DIRECTIONS = %i[top bottom left right].freeze

  def initialize(grid)
    @grid = grid
  end

  def height
    grid.length
  end

  def width
    grid.first.length
  end

  def tree_visable?(tree_location)
    return true if tree_at_edge?(tree_location)

    tree_visable_from_top?(tree_location) ||
      tree_visable_from_bottom?(tree_location) ||
      tree_visable_from_left?(tree_location) ||
      tree_visable_from_right?(tree_location)
  end

  def number_of_trees_visable
      grid_visable_status = grid.map.with_index do |tree_row, row_index|
        tree_row.map.with_index do |_tree, col_index|
          tree_visable?([row_index, col_index])
        end
      end
      grid_visable_status.flatten.filter { |value| value }.length
  end

  def tree_at_edge?(tree_location)
    row_index, col_index = tree_location
    return true if row_index == 0 || row_index == height ||
                   col_index == 0 || col_index == width

    false
  end

  def height_at(location)
    grid[location[0]][location[1]]
  end

  def locations_to_edge_top(tree_location)
    row_index, col_index = tree_location
    row_range_to_edge = 0...row_index
    row_range_to_edge.to_a.reverse.map { |row_index_to_edge| [row_index_to_edge, col_index] }
  end

  def locations_to_edge_bottom(tree_location)
    row_index, col_index = tree_location
    row_range_to_edge = (row_index + 1)...height
    row_range_to_edge.map { |row_index_to_edge| [row_index_to_edge, col_index] }
  end

  def locations_to_edge_left(tree_location)
    row_index, col_index = tree_location
    col_range_to_edge = 0...col_index
    col_range_to_edge.to_a.reverse.map { |col_index_to_edge| [row_index, col_index_to_edge] }
  end

  def locations_to_edge_right(tree_location)
    row_index, col_index = tree_location
    col_range_to_edge = (col_index + 1)...width
    col_range_to_edge.map { |col_index_to_edge| [row_index, col_index_to_edge] }
  end

  def tree_visable_from_top?(tree_location)
    all_lower_than_one?(tree_location, locations_to_edge_top(tree_location))
  end

  def tree_visable_from_bottom?(tree_location)
    all_lower_than_one?(tree_location, locations_to_edge_bottom(tree_location))
  end

  def tree_visable_from_left?(tree_location)
    all_lower_than_one?(tree_location, locations_to_edge_left(tree_location))
  end

  def tree_visable_from_right?(tree_location)
    all_lower_than_one?(tree_location, locations_to_edge_right(tree_location))
  end

  def all_lower_than_one?(tree_location, locations)
    locations.all? { |location| height_at(location) < height_at(tree_location) }
  end

  def locations_to_edge(edge, tree_location)
    {
      top: locations_to_edge_top(tree_location),
      bottom: locations_to_edge_bottom(tree_location),
      left: locations_to_edge_left(tree_location),
      right: locations_to_edge_right(tree_location)
    }[edge]
  end

  def view_distance_from_edge(edge, tree_location)
    to_edge_locations = locations_to_edge(edge, tree_location)
    return 0 if to_edge_locations.empty?

    index = to_edge_locations.find_index { |location| height_at(location) >= height_at(tree_location) }
    return index + 1 if index

    to_edge_locations.length
  end

  def scenic_score(tree_location)
    DIRECTIONS.reduce(1) do |result, edge|
      result * view_distance_from_edge(edge, tree_location)
    end
  end

  def highest_scenic_scenic_score
    grid_scenic_score = grid.map.with_index do |tree_row, row_index|
      tree_row.map.with_index do |_tree, col_index|
        scenic_score([row_index, col_index])
      end
    end
    grid_scenic_score.flatten.max
  end
end
