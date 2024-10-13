module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield(element) if block_given?
    end
  end

  def my_each_with_index
    index = 0
    for element in self
      yield(element, index) if block_given?
      index+=1
    end
  end

  def my_select
    myArray = []
    for element in self
      myArray << element if block_given? && yield(element)
    end

    myArray
  end

  def my_all?
    for element in self
      return false unless block_given? && yield(element)
    end
    
    true
  end

  def my_any?
    for element in self
      return true if block_given? && yield(element)
    end

    false
  end

  def my_none?
    for element in self
      return false if block_given? && yield(element)
    end
    
    true
  end

  def my_count
    return self.length unless block_given?

    count = 0
    for element in self
      count += 1 if yield(element)
    end

    count
  end

  def my_map
    neoArray = []

    for element in self
      neoArray << yield(element) if block_given?
    end

    neoArray
  end

  def my_inject(accomulator = 0)
    for element in self
      accomulator = yield(accomulator, element) if block_given?
    end

    accomulator
  end
end
