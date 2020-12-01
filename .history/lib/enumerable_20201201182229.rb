module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    my_array = []
    while i < to_a.length
      my_array[i] = yield to_a[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    self.length.times do |i|
      yield(self[i], i)
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    my_array = []
    my_each { |item| my_array << item if yield item }
    my_array
  end

  def my_all?(param = nil)
    if block_given?
      my_each { |item| return false if yield(item) == false }
    elsif param.nil?
      my_each { |item| return false if item.nil? || item == false }
    elsif !param.nil? && (param.is_a? Class)
      my_each { |item| return false unless [item.class, item.class.superclass].include?(param) }
    elsif !param.nil? && param.instance_of?(Regexp)
      my_each { |item| return false unless param.match(item) }
    else
      my_each { |item| return false if item != param }
    end
    true
  end

  def my_any?(param = nil)
    if block_given?
      my_each { |item| return true if yield(item) }
      return false
    elsif param.nil?
      my_each { |item| return true if item }
    elsif !param.nil? && (param.is_a? Class)
      my_each { |item| return true if [item.class, item.class.superclass].include?(param) }
    elsif !param.nil? && param.instance_of?(Regexp)
      my_each { |item| return true if param.match(item) }
    else
      my_each { |item| return true if item == param }
    end
    false
  end

  def my_none?(param = nil)
    if block_given?
      my_each { |item| return false if yield(item) == true }
    elsif param.nil?
      my_each { |item| return false if item == true }
    elsif !param.nil? && (param.is_a? Class)
      my_each { |item| return false if [item.class, item.class.superclass].include?(param) }
    elsif !param.nil? && param.instance_of?(Regexp)
      my_each { |item| return true unless param.match(item) }
    else
      my_each { |item| return true unless item == param }
    end
    true
  end

  def my_count(param = nil)
    count = 0
    if block_given?
      my_each { |item| count += 1 if yield item }
    elsif !param.nil?
      my_each { |item| count += 1 if item == param }
    else
      my_each { |_item| count += 1 }
    end
    count
  end

  def my_map(_param = nil)
    my_array = []
    my_each { |item| my_array << yield(item) }
    my_array
  end

  def my_proc(_param = nil)
    my_array = []
    my_each { |item| my_array << yield(item) }
    my_array
  end

 

  def my_inject(param = nil, operator = nil)
     if block_given?
      my_each { |item| param = param.nil? ? item : yield(param, item) }
       else
      if operator.nil?
        operator = param
        param = nil
      end
      operator = operator.to_sym
      my_each { |item| param = param.nil? ? item : param.send(operator, item) }
    end
    puts param
    end
  end
