require './node.rb'

class LinkedList

  attr_reader :size, :head, :tail

  def initialize
    @tail = nil
    @head = nil
    @size = 0
  end

  # Add a new node at the end of the list
  def append(value)
    node = Node.new(value)
    unless @tail.nil?
      @tail.next = node
    end
    @tail = node

    if @head.nil?
      @head = node
    end

    @size += 1
  end

  # Add a new node at the start of the list
  def prepend(value)
    node = Node.new(value)
    node.next = @head
    @head = node

    if @tail.nil?
      @tail = node
    end

    @size += 1
  end

  # Returns the node at `index`
  def at(index)
    if index > @size
      return nil
    end

    runner = @head
    index.times.each do |i|
      runner = runner.next
    end
    runner
  end

  # Remove the last node from the list
  def pop
    if @size == 0
      return
    end

    previous = nil
    runner = @head
    (@size - 1).times.each do |i|
      previous = runner
      runner = runner.next
    end

    if previous.nil?
      @head = nil
      @tail = nil
    else
      previous.next = nil
      @tail = previous
    end

    @size -= 1
    runner
  end

  # Returns whether the list contains `value`
  def contains?(value)
    runner = @head
    until runner.nil?
      if runner.value == value
        return true
      end
      runner = runner.next
    end
    false
  end

  # Returns the index of the first occurrence of `value`, or nil
  def find(value)
    index = 0
    runner = @head
    until runner.nil?
      if runner.value == value
        return index
      end
      index += 1
      runner = runner.next
    end

    nil
  end

  # Returns a string representation of the list
  def to_s
    string = ""
    runner = @head
    0.upto(@size - 1).each do |index|
      string << runner.value.to_s
      if index < @size - 1
        string << " -> "
      end
      runner = runner.next
    end
    string
  end

  # Insert `value` at the index
  def insert_at(value, index)
    if index == 0
      prepend(value)
    elsif index >= @size
      append(value)
    else
      previous = nil
      runner = @head
      index.times do |i|
        previous = runner
        runner = runner.next
      end

      node = Node.new(value)
      previous.next = node
      node.next = runner

      @size += 1
    end
  end

  # Remove the node at `index`
  def remove_at(index)
    if index >= index
      pop
      nil
    elsif index == 0
      if @head.nil?
        # Do nothing
      elsif @head == @tail
        @head = nil
        @tail = nil
        @size -= 1
      else
        @head = @head.next
        @size -= 1
      end
    else
      previous = nil
      runner = @head
      index.times.each do |i|
        previous = runner
        runner = runner.next
      end
      previous.next = runner.next
      @size -= 1
    end
  end
end