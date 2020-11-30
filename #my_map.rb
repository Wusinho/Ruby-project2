array = [1,2,3,4,5]

#print array.map {|a| a <2}

def my_map (arr) 
    myArray = []
    switch = true
        while switch
            switch = false
                arr.length.times do |i|
                                        
                    myArray.push(yield(arr[i]))
                                          
                end
        end     
        print myArray
    end

   my_map(array) do |a|
     a + 2
   end