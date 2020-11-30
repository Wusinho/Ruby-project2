module Enumerable

def my_each
    return to_enum(:my_each) unless block_given?
    arr = self.to_a
        arr.length.times do |i|
            yield(arr[i]) 
        end
    self
end

def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    arr = self.to_a
        arr.length.times do |i|
            yield(arr[i], i) 
        end
    self
end

def my_select
    return to_enum(:my_select) unless block_given?
    arr = self.to_a
    myArray = []   
        arr.length.times do |i|
            if yield(arr[i])
                myArray.push(arr[i])
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


  
    
    
