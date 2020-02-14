require "byebug"

def my_min(list) #O(n^2)
  list.each do |ele1|
    return ele1 if list.all? { |ele2| ele2 >= ele1}
  end
  nil
end

def my_min2(list) #O(n)
  min = list.first 
  (1...list.length).each do |ele|
    min = list[ele] if list[ele] < min
  end

  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)
# p my_min2(list)



def largest_contiguous_subsum(list)     # O(n^2)
  array = []
  list.each_with_index do |ele1, i1|    # O(n^2)
    (i1...list.length).each do |i2|
      array << list[i1..i2]
    end
  end

  max_sum = array.first.sum
  array[1..-1].each do |subarr|         # O(n^2)
    sum = subarr.sum
    if sum > max_sum
      max_sum = sum
    end
  end

  max_sum

end

def largest_contiguous_subsum2(list)
  total_sum = list.first
  current_sum = list.first 

  list[1..-1].each do |ele|
    # debugger
    total_sum += ele 
    if ele > current_sum && ele > total_sum
      current_sum = ele 
      total_sum = ele
    elsif ele > total_sum 
      total_sum = 0 + ele
    elsif total_sum > current_sum
      current_sum = total_sum
    end
  end

  current_sum
end


list = [5, 3, -7]
list2 = [-5, -1, -3]
list3 = [2, 3, -6, 7, -6, 7]
list4 = [4, 2, -1, -6, 5, 7, -2, 5]
p largest_contiguous_subsum(list) # => 8
p largest_contiguous_subsum2(list) # => 8
p largest_contiguous_subsum2(list2) # => -1 
p largest_contiguous_subsum2(list3) # => 8

p largest_contiguous_subsum(list4)
p largest_contiguous_subsum2(list4)

