require 'byebug'


def my_min(list) # time O(n^2)  space O(1)
    result = 0 # 1
    list.each do |ele| # n
        result = ele if list.all? { |ele2| ele <= ele2 } # n
    end
    result # 1
end

def my_min(list) # time O(n) space O(1)
    list.inject do |min, ele| # n
        if ele < min
            min = ele
        end
        min
    end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

def largest_contiguous_subsum(list) # 1 + n * (n * n) + n^2 * n + n^2 ->  1 + n^3 + n^3 + n^2 -> time O(n^3) space O(n^3)
    subs_arr = [] # O(1)   O(n^2)
    (0...list.length).each do |start| # n
        (start...list.length).each do |stop| # n
            subs_arr << list[start..stop] # n
        end
    end
    subs_arr.map! { |sub| sub.sum } # n^2 * n
    subs_arr.max # n^2
end

# def largest_contiguous_subsum(list) # n + n -> time O(n) space O(1)
    
#     stop = 0 # 1
#     start = 0 # 1
#     largest = list[0] # 1
#     compare = list[stop] # 1
#     while true # n
#         # debugger
#         if largest < compare # 1
#             largest = compare # 1
#         end
        
#         stop += 1 # 1
#         compare += list[stop] # 1
        
#         if stop == list.length - 1 # 1
#             stop = 1 # 1
#             start += 1 # 1
#             compare = list[start] # 1
#         end

#         if start == list.length - 1 # 1
#             break # 1
#         end
#     end
#     sum = list.sum
#     left_off =  sum > list.last ? sum : list.last # n
#     largest > left_off ? largest : left_off  # 1

# end
def largest_contiguous_subsum(list)
    largest = list[0]
    total = 0
    list.each do |ele|
        total += ele
        # debugger
        if largest < total
            largest = total
        end
        if largest < ele
            largest = ele
            total = ele
        end
    end
    largest
end


list = [1,2,3,4,5,6]
p largest_contiguous_subsum(list) # => 21

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])