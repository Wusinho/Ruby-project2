# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

module Enumerable
#   # # 1.my_each
  def my_each
    return to_enum(:my_each) unless block_given?
    i = 0
    myArray = []
    while i < to_a.length
      myArray[i] = yield to_a[i]
      i += 1
    end
    self
  end


# def my_each_with_index
#     return to_enum(:my_each_with_index) unless block_given?
#     arr = self.to_a
#         arr.length.times do |i|
#             yield(arr[i], i) 
#         end
#     self
# end


# def my_select
#   return to_enum(:my_select) unless block_given?
#   arr = self.to_a
#   myArray = []

#     my_each {|item| myArray << item if yield item }
#     myArray
  
# end


#    def my_all?(param = nil)
#     if block_given?
#       my_each { |item| return false if yield(item) == false }
#       return true
#     elsif param.nil?
#       my_each { |item| return false if item.nil? || item == false }
#     elsif !param.nil? && (param.is_a? Class)
#       my_each { |item| return false unless [item.class, item.class.superclass].include?(param) }
#     elsif !param.nil? && param.class == Regexp
#       my_each { |item| return false unless param.match(item) }
#     else
#       my_each { |item| return false if item != param }
      
#     end
#     true
#   end


#   def my_any?(param = nil)
#     if block_given?
#         my_each { |item| return true if yield(item) }
#         return false
#     elsif param.nil?
#         my_each { |item| return true if item }
#     elsif !param.nil? && (param.is_a? Class)
#         my_each { |item| return true if [item.class, item.class.superclass].include?(param) }
#     elsif !param.nil? && param.class == Regexp
#         my_each { |item| return true if param.match(item) }
#     else
#         my_each { |item| return true if item == param }
#     end
#     false
#   end


# def my_none? (param = nil)
#   if block_given?
#         my_each { |item| return false if yield(item)  == true }
#     elsif param.nil?
#         my_each { |item| return false if item == true }
#      elsif !param.nil? && (param.is_a? Class)
#         my_each { |item| return false if [item.class, item.class.superclass].include?(param) }
#     elsif !param.nil? && param.class == Regexp
#         my_each { |item| return true unless param.match(item) }
#     else
#         my_each { |item| return true unless item == param }
#    end
#    true
# end


# def my_count (param = nil)
#   count = 0
#   if block_given?
#     my_each { |item| count += 1 if yield item}
    
#   elsif !param.nil?
#     my_each { |item| count += 1 if item == param}    
#   else
#     my_each { |item| count += 1}
#   end
#   return count
# end

# def my_map (param = nil)
#   myArray = []
#     my_each { |item| myArray << yield(item) }
#     myArray
# end

# def my_proc (param = nil)
#   myArray = []
#     my_each { |item| myArray << yield(item) }
#     myArray
# end



def my_inject(param = nil, param2 = nil)
  if block_given?
    puts "condicional 1"
    my_each { |item| param = param.nil? ? item : yield(param, item) }
  else
    puts "condicional 2"
    if param2.nil?
      sym = param.to_sym
    my_each { |item| item.send(sym, item)}
    puts sym
    else
      initial = param
      sym = param2.to_sym
    my_each { |item| item.send(sym)}

    puts sym
  end
  end
    puts param
end


    # if !param[0].nil? && param[1].is_a? Symbol 
    # initial = param[0]
    # sym = param[1].to_sym

#my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']

#puts my_order.map { |item| item.gsub('medium', 'extra large')}




# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity











end   



    
