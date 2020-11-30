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

   # 4.my_all?
#    def my_all?(param = nil)
#     if block_given?
#       puts "conditonal 1"
#       to_a.my_each { |item| return false if yield(item) == false }
#       return true
#     elsif param.nil?
#       puts "condi"
#       to_a.my_each { |item| return false if item.nil? || item == false }
#     elsif !param.nil? && (param.is_a? Class)
#       puts "conditonal 3"
#       to_a.my_each { |item| return false unless [item.class, item.class.superclass].include?(param) }
#     elsif !param.nil? && param.class == Regexp
#       puts "conditonal 4"
#       to_a.my_each { |item| return false unless param.match(item) }
#     else
#       puts "conditonal 5"
#       to_a.my_each { |item| return false if item != param }
      
#     end
#     puts "conditonal 6"
#     true
#   end

  5.my_any?
  def my_any?(param = nil)
    if block_given?
      puts "conditional 1"
      to_a.my_each { |item| return true if yield(item) }
      return false
    elsif param.nil?
      puts "conditional 2"
      to_a.my_each { |item| return true if item }
    elsif !param.nil? && (param.is_a? Class)
      puts "conditional 3"
      to_a.my_each { |item| return true if [item.class, item.class.superclass].include?(param) }
    elsif !param.nil? && param.class == Regexp
      puts "conditional 4"
      to_a.my_each { |item| return true if param.match(item) }
    else
      puts "conditional 5"
      to_a.my_each { |item| return true if item == param }
    end
    puts "conditional 6"
    false
  end


def my_none? (param = nil)
  if block_given?
        puts "conditional 1"
        to_a.my_each { |item| return false if yield(item)  == true }
    elsif param.nil?
        puts "conditional 2"
        to_a.my_each { |item| return false if item == true }
     elsif !param.nil? && (param.is_a? Class)
       puts "condicional 3"
         to_a.my_each { |item| return false if [item.class, item.class.superclass].include?(param) }
    elsif !param.nil? && param.class == Regexp
     puts "conditional 4"
      to_a.my_each { |item| return true unless param.match(item) }
    else
     puts "conditional 5"
     to_a.my_each { |item| return true unless item == param }
   end
   puts "conditional 6"
   true
  
end

  def my_select
    arr = self.to_a
      myArray = []
        arr.length.times do |i|
                if yield(arr[i])
                myArray.push(arr[i])
                end
        end
        puts myArray
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


  
    
    
