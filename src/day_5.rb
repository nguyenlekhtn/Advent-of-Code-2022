require_relative 'day'
require_relative './move_command'

class Day5 < Day
  def first_part_result(path)
    parsed_data = parse(path)
    moved_stacks = move_stacks(**parsed_data)
    top_of_each(moved_stacks)
  end

  def second_part_result(path)
    parsed_data = parse(path)
    moved_stacks = move_stacks_9001(**parsed_data)
    top_of_each(moved_stacks)
  end

  def parse(path)
    stacks = []
    commands = []
    File.open(path).readlines(chomp: true).each do |line|
      if line.match?(/\[[A-Z]\]/)
        line_arr = line.chars
        line_arr.each_with_index do |char, char_index|
          next unless char.match?(/[A-Z]/)

          stack_index = (char_index - 1) / 4
          stacks[stack_index] = [] unless stacks[stack_index]

          stacks[stack_index].push(char)
        end
      else
        match_data = line.match(/move (\d+) from (\d+) to (\d+)/)
        if match_data
          matched = match_data.captures.map(&:to_i)
          command = MoveCommand.new(quantity: matched[0], from_index: matched[1] - 1, to_index: matched[2] - 1)
          commands.push(command)
        end
      end
    end

    { stacks: stacks.map(&:reverse), commands: commands }
  end

  def move_stacks(stacks:, commands:)
    commands.reduce(stacks) do |moved_stacks, command|
      command.move(moved_stacks)
    end
  end

  def move_stacks_9001(stacks:, commands:)
    commands.reduce(stacks) do |moved_stacks, command|
      command.move_9001(moved_stacks)
    end
  end

  def top_of_each(stacks)
    stacks.map(&:last).join
  end
end

# get stacks from input
# get move command from input
# get top of each stack from stacks and move commands
