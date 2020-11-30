module Enumerable

def my_each
    return to_enum(:my_each) unless block_given?
    arr = self.to_a        
    
            arr.length.times do |i|
                yield(arr[i]) 
            end
    #puts self

end

def my_each_with_index
    arr = self.to_a

switch = true
    while switch
        switch = false
            arr.length.times do |i|
                yield(arr[i], i) if block_given?  
            end
    end 
end

def my_select
    arr = self.to_a

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
        return myArray
    end 
  



def my_all?
arr = self.to_a

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
        if myArray.length == arr.length
            puts true
        else
            puts false
    end
    
  end
      
     
  #puts %w[ant bear cat].my_all?(/t/)
    
      
























end   


  
    
    
