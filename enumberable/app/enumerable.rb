module Enumerable

  def my_each
    return self unless block_given?

    for i in self
      yield(i)
    end
    self
  end

  def my_each_with_index
    return self unless block_given?

    index = 0
    self.length.times do
      yield(self[index],index)
      index += 1
    end
  end

  def my_select
    return self unless block_given?
    result = []
    self.my_each do |item| 
      result << item if yield(item)
    end
    result
  end

  def my_all?
    self.my_each do |item|
      passes_test = block_given? ? yield(item) : item
      return false unless passes_test
    end
    true
  end

  def my_any?
    self.my_each do |item|
      item_match = block_given? ? yield(item) : item
      return true if item_match
    end

    false
  end

  def my_none?
    self.my_each do |item|
      item_exists = block_given? ? yield(item) : item
      return false if item_exists
    end

    true
  end

  def my_count(object_of_interest = nil)
    count = 0
    for element in self
      if !object_of_interest.nil?
        count += 1 if object_of_interest.eql? element
      elsif block_given?
        count += 1 if yield(element)
      else
        count +=1
      end
    end
    count
  end

  def my_map
    return self.to_enum unless block_given?
    result = []
    self.my_each { |item| result << yield(item) }
    result
  end

  def my_inject(initial = nil, sym = nil)
    accumulator = initial
    start_point = 0


    if accumulator.nil?
      start_point = 1
      accumulator = self.first
    end

    for i in start_point..(self.count - 1) do
      item = self[i]
      
      if block_given?
        accumulator = yield(accumulator,item)
      else
        using = sym.nil? ? initial : sym
        accumulator = accumulator.send(using,item)
      end
    end

    return accumulator
  end
end