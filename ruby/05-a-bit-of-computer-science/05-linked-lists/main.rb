require './linked_list.rb'

list = LinkedList.new

puts list.to_s # ""
puts list.size # 0

list.append(3) # [3]
puts list.to_s

list.append(4) # [3, 4]
puts list.to_s

list.prepend(1) # [1, 3, 4]
puts list.to_s

list.insert_at(2, 1) # [1, 2, 3, 4]
puts list.to_s

list.insert_at(5, 20) # [1, 2, 3, 4, 5]
puts list.to_s

puts list.to_s # 1 -> 2 -> 3 -> 4 -> 5
puts list.size # 5
puts list.pop # 5
puts list.to_s # 1 -> 2 -> 3 -> 4
puts list.size # 4

puts list.head # 1
puts list.tail # 4

puts list.contains?(3) # true
puts list.contains?(30) # false

puts list.find(2) # 1
puts list.find(20) # nil
