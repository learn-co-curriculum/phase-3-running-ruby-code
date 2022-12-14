require 'pry'

array = %w(Brooke Gehrig Cecilia)
#the given method we want to rewrite
#array.each{|name| puts name}
# def my_each(array)
#     yield array
# end
# my_each(array) {|a| puts a}
#the following will show that this isn't quite right  we will need
# to modify the above method to go through each item in the array
# my_each(array) {|a| puts "I am #{a}"}
def my_each(array)
    i = 0
    while i < array.length
        yield array[i]
        i += 1
    end
end
#my_each(array) {|a| puts "I am #{a}"}
#the implicit return of Ruby is the last item it evaluated
#explicit return will stop the execution of code
def my_find(array)
    i = 0
    while i < array.length
        return array[i] if yield array[i]  
        i += 1
    end
end
#puts my_find(array) {|a| a[0] == "C"}     # irb returns item if called this way:
                                          # my_find (array) {|a| puts a[0] == "C"}
def my_map(array)
    i = 0
    new_array = []
    while i < array.length
        item = yield array[i]
        new_array << item
        i += 1
    end
    new_array
end
puts my_map (array) {|a| a.upcase}