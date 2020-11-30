array = [1,2,3,4,5]


def my_each(arr) 
switch = true
    while switch
        switch = false
            arr.length.times do |i|
                yield(arr[i]) if block_given?  
            end
    end 
end

   
  
my_each(array) do |a| 
   print a * 2
end