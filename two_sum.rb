#   Two Sum

#   Brute force
#   Double range pair adding
#   O(n^2)

def two_sum?(arr, target) # O(n^2)
    arr.each_with_index do |num, idx|
        arr.each_with_index do |num2, idx2|
            return true if (num + num2) == target && idx2 > idx
        end
    end
    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

#   Sorting
#   6 [2,5,4,6] 6 - 6
# 10 - 2 = 8 = pivot

#   pivot would be the target and we look at 
#   take the lower half and iterate first and last eles



