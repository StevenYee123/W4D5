def first_anagram?(str1, str2)             #O(n!) | O(n!)
  arr = str1.split("")
  # arr.permutation.to_a.include?(str2)
  arr = arr.permutation.to_a
  arr.map! { |subarr| subarr.join("") }

  arr.include?(str2)
end


# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)     # O(n^3) | O(n^3)
  arr1 = str1.split("")
  arr2 = str2.split("")
  arr1.each do |char1|
    arr2.each_with_index do |char2, i|
      if char1 == char2
        arr2.delete_at(i) 
        break
      end
    end
  end
  arr2.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2) # O(nlogn) // O(n)
  arr1 = str1.split("").sort
  arr2 = str2.split("").sort

  arr1 == arr2
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2) #O(n) | O(n)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char do |char|
    hash1[char] += 1 
  end

  str2.each_char do |char|
    hash2[char] += 1
  end

  hash1 == hash2
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true

def bonus_anagram?(str1, str2) #O(n) | O(n)
  hash = Hash.new(0)

  str1.each_char do |char| 
    hash[char] += 1 
  end

  str2.each_char do |char|
    hash[char] -= 1
  end

  hash.values.all? { |ele| ele == 0}
end

p bonus_anagram?("gizmo", "sally")
p bonus_anagram?("elvis", "lives")