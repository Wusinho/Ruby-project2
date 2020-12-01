array = [1,2,3,4,5]


def my_each_my_index(arr) 
switch = true
    while switch
        switch = false
            arr.length.times do |i|
                yield(arr[i], i) if block_given?  
            end
    end 
end

   
  
my_each_my_index(array) do |a,b| 
   puts " index: #{b} value :#{a} " 
end