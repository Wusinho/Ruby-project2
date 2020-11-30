#array = [1,2,3,4,5] 


def my_all?(arr)
    myArray = []
    switch = true
        while switch
            switch = false
                arr.length.times do |i|

                    if yield(arr[i])
                        puts (arr[i])
                    myArray.push(arr[i])
                    end
                end
        end
        if myArray.length == arr.length
        puts true
        else
        puts false
    end
  end
  
   
#[1, 2i, 3.14].my_all?(Numeric) #=> true
    
   #my_all?(["ant", "bear", "cat"]) { |word| word.length >= 4 } #=> true
   #(%w[ant bear cat].my_all? { |word| word.length >= 4 }) #=> false
   # %w[ant bear cat].my_all?(/t/) #=> false
   #[].my_all? #=> true

   
puts .my_all?([1, 2i, 3.14]) {(Numeric)}    #=> true
  