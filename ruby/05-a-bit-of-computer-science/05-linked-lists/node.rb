class Node

  attr_reader :value
  attr_accessor :next

  def initialize(value = 0)
    @value = value
    @next = nil
  end
end