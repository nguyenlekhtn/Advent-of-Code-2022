require_relative 'component'

class FileComponent < Component
  attr_reader :size, :type

  def initialize(**opts)
    super
    @size = opts[:size]
  end

  def type
    'file'
  end
end