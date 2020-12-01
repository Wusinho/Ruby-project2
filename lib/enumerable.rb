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
  

def my_all?(param = nil)
    if block_given?
      to_a.my_each { |item| return false if yield(item) == false }
      puts "1era condicional"
        

    elsif param.nil?
      to_a.my_each { |item| return false if item.nil? || item == false }
         puts "2da condicional"

     elsif !param.nil? && (param.is_a? Class)
       to_a.my_each { |item| return false unless [item.class, item.class.superclass].include?(param) }
       puts "3ra condicional"
       
     elsif !param.nil? && param.class == Regexp
         puts "4ta condicional"
       to_a.my_each { |item| return false unless param.match(item) }

     else
         puts "5ta condicional"
       to_a.my_each { |item| return false if item != param }

     end

    puts "6ta condicional"

    true
  end


=begin
    
rescue => exception
    
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
      
=end   
  
    











end   


  
    
    
