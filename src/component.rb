class Component
  attr_reader :name, :parent

  def initialize(**opts)
    @name = opts[:name]
    @parent = opts[:parent]
  end

  def size
    0
  end

  def ==(other)
    @name == other.name && @parent == other.parent && @type = other.type
  end
end
