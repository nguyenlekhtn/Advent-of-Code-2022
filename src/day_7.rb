require_relative 'dir_component'
require_relative 'file_component'
class Day7
  def first_part_result(path)
    lines = File.open(path).readlines(chomp: true)
    get_directories_and_root(lines) => {root:, directories:}
    sum_sizes_directories_at_most_100000(directories) 
  end

  def second_part_result(path)
    lines = File.open(path).readlines(chomp: true)
    get_directories_and_root(lines) => {root:, directories:}
    unused_space_left = 70000000 - root.size
    unused_space_needed = 30000000 - unused_space_left
    directory_to_delete = directories.filter { |dir| dir.size >= unused_space_needed }.sort { |a, b| a.size <=> b.size }.first
    directory_to_delete.size
  end

  def sum_sizes_directories_at_most_100000(directories)
    directories.map(&:size).filter { |size| size <= 100000 }.sum
  end

  def get_directories_and_root(lines)
    current_wd = nil
    root = DirComponent.new(name: '/')
    directories = []

    cd_prod = Proc.new do |dir_name|
      case dir_name
      when '/'
        current_wd = root
      when '..'
        current_wd = current_wd.parent || current_wd
      else
        current_wd = current_wd.find_dir_child(dir_name) || DirComponent.new(name: dir_name, parent: current_wd)
      end
    end
    lines.each do |line|
      if line.match?(/\$ cd \S+/)
        dir_name  = line.match(/\$ cd (\S+)/).captures.first
        cd_prod.call dir_name
        directories.push(current_wd) unless directories.include? current_wd
      elsif line.include?('dir')
        dir_name = line.split(' ')[1]
        child = DirComponent.new(name: dir_name, parent: current_wd)
        current_wd.add_component(child)
        directories.push(child) unless directories.include? child
      elsif line.match?(/(\w+) ([\w\.]+)/)
        size, file_name = line.match(/(\w+) ([\w\.]+)/).captures
        child = FileComponent.new(name: file_name, parent: current_wd, size: size.to_i)
        current_wd.add_component(child)
      end
    end

    {root:, directories:}
  end
end