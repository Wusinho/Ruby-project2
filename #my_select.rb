array = [3,2,1,4,5]


#print array.select { |a| a <3}

def my_select(arr) 
    myArray = []
    switch = true
        while switch
            switch = false
                arr.length.times do |i|
                    if yield(arr[i])
                        myArray.push(arr[i])
                    end
                end
        end     
        puts myArray
    end
    
       
    my_select(array) do |a|
          a < 3
    end
    
