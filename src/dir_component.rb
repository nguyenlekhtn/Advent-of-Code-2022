require_relative 'component'

class DirComponent < Component
  attr_reader :contexts

  def initialize(**opts)
    super
    @contexts = []
  end

  def add_component(component)
    @contexts.push(component) unless contexts.include? component
  end

  def size
    contexts.map(&:size).sum
  end

  def type
    'dir'
  end

  def find_dir_child(name)
    contexts.find { |context| context.name == name && context.type == 'dir' }
  end



end