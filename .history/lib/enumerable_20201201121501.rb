# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

module Enumerable
  # # 1.my_each
  def my_each
    return to_enum(:my_each_with_index) unless block_given?
    arr = self.to_a
        arr.length.times do |i|
            yield(arr[i]) 
        end
    self
  end
  
  # # # 1.my_each
  def my_each
  #   return to_enum(:my_each) unless block_given?
  #   i = 0
  #   myArray = []
  #   while i < to_a.length
  #     myArray[i] = yield to_a[i]
  #     i += 1
  #   end
  #   self
  # end

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
    myArray << arr[i] if yield(arr[i])
  end
  puts myArray
end


def my_select
  return to_enum(:my_select) unless block_given?
  arr = self.to_a
  myArray = []
  arr.length.times do |i|
    myArray << arr[i] if yield(arr[i])
  end
  puts myArray
end




   def my_all?(param = nil)
    if block_given?
      to_a.my_each { |item| return false if yield(item) == false }
      return true
    elsif param.nil?
      to_a.my_each { |item| return false if item.nil? || item == false }
    elsif !param.nil? && (param.is_a? Class)
      to_a.my_each { |item| return false unless [item.class, item.class.superclass].include?(param) }
    elsif !param.nil? && param.class == Regexp
      to_a.my_each { |item| return false unless param.match(item) }
    else
      to_a.my_each { |item| return false if item != param }
      
    end
    true
  end


  def my_any?(param = nil)
    if block_given?
      to_a.my_each { |item| return true if yield(item) }
      return false
    elsif param.nil?
      to_a.my_each { |item| return true if item }
    elsif !param.nil? && (param.is_a? Class)
      to_a.my_each { |item| return true if [item.class, item.class.superclass].include?(param) }
    elsif !param.nil? && param.class == Regexp
      to_a.my_each { |item| return true if param.match(item) }
    else
      to_a.my_each { |item| return true if item == param }
    end
    false
  end


def my_none? (param = nil)
  if block_given?
        to_a.my_each { |item| return false if yield(item)  == true }
    elsif param.nil?
        to_a.my_each { |item| return false if item == true }
     elsif !param.nil? && (param.is_a? Class)
         to_a.my_each { |item| return false if [item.class, item.class.superclass].include?(param) }
    elsif !param.nil? && param.class == Regexp
      to_a.my_each { |item| return true unless param.match(item) }
    else
     to_a.my_each { |item| return true unless item == param }
   end
   true
end


def my_count (param = nil)
  arr = self.to_a
  count = 0
  if block_given?
    to_a.my_each { |item| count += 1 if yield item}
  elsif !param.nil?
    to_a.my_each { |item| count += 1 if item == param}
  else
    to_a.my_each { |item| count += 1}
  end
  return count
end


end   


  
    
    
