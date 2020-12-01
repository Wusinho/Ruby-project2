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

    to_a.length.times do |i|
      yield(to_a[i], i)
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
    arr = self
    if block_given?
      arr.my_each { |x| return false if yield(x) == false }
      return true
    elsif !block_given? param.nil?
      arr.my_each { |x| return false if x.nil? || x == false }
    elsif param.is_a?(Class)
      arr.my_each { |x| return false unless x.is_a?(param) }
    elsif param.is_a?(Regexp)
      arr.my_each { |x| return false unless param.match(x) }
    else
      arr.my_each { |x| return false if item != param }
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

  def my_map(proc = nil)
    return to_enum unless block_given? || proc

    my_array = []
    if proc
      my_each { |item| my_array << proc.call(item) }
    else
      my_each { |item| my_array << yield(item) }
    end
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
