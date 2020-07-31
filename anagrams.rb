def first_anagram?(str1, str2) # O(n!)
    anagrams = str1.split("").permutation(str2.length).to_a
    anagrams.include?(str2.split(""))
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true


def second_anagram?(str1, str2) # O(n + n*n) -> O(n^2)
    alpha = ("a".."z").to_a # 1
    arr = str2.split("") # n
    str1.each_char do |char| # n
        a_idx = alpha.index(char) # 1
        arr.reject! {|char2| alpha.index(char2) == a_idx} # n * 1
    end
    arr.empty? # 1
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true 

def third_anagram?(str1, str2) # O(n log n) linearithimic
    str1.chars.sort == str2.chars.sort
end


# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true 

def fourth_anagram?(str1, str2) # O(n)
    hash = Hash.new(0) # 1
    str1.each_char {|char| hash[char] += 1} # n
    str2.each_char {|char| hash[char] -= 1} # n

    hash.values.all?(0) # n

end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true 