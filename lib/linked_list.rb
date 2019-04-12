require "./lib/node"
require 'pry'

class LinkedList
  attr_reader :head,
              :count

  def initialize(head = nil)
    @head = head
    @count = 0
  end

  def append(node_data)
    if @head.nil?
      @head = Node.new(node_data)
    else
      find_last.next_node = Node.new(node_data)
    end
    @count += 1
    return node_data
  end

  def prepend(node_data)
    if @head.nil?
      @head = Node.new(node_data)
    else
      before_first = @head
      @head = Node.new(node_data)
      @head.next_node = before_first
    end
    @count += 1
    return @head.data
  end

  def find_last
    node = @head
    if node.next_node.nil?
      return node
    else
      until node.next_node.nil?
          node = node.next_node
        return node
      end
    end
    @count += 1
  end

  def to_string
    node = @head
    array = []
    if node.next_node.nil?
      return node.data
    else
      array << node.data
      while node.next_node
          node = node.next_node
          array << node.data
      end
    end
    array.join(" ")
  end

  def insert(position, node_data)
    node = @head
    previous_node = find_node(position - 1)
    node_after = previous_node.next_node
    previous_node.next_node = Node.new(node_data)
    previous_node.next_node.next_node = node_after
    @count += 1
    node_data
  end

  def find_node(position)
   node = @head
   current_position = 0
   until current_position = position
     node = node.next_node
     current_position += 1
   end
   return node
  end

  def find(position, number_of_elements)
    node = find_node(position)
    data = [node.data]
    total = 1
    until total = number_of_elements
      node = node.next_node
      data << node.data
      total += 1
    end
    return data.join(" ")
  end

end
