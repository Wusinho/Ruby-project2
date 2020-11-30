array = [1,2,3,4,5]


def my_each(arr) 
    return to_enum(:my_each) unless block_given?

            arr.length.times do |i|
                print i
                yield(arr[i])
            end

end

   
  

my_each(array){|a| puts a}