module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?
    
    i = 0
    for value in self do
      yield value, i
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    selected_array = []
    for value in self do
      selected_array << value if yield value
    end
    selected_array
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    for value in self do
      return false unless yield value
    end
    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    for value in self do
      return true if yield value
    end
    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    for value in self do
      return false if yield value
    end
    true
  end

  def my_count

    count = 0
    for value in self do
      if block_given?
        count += 1 if yield value
      else
        count +=1
      end
    end
    count
  end

  def my_map
    return self unless block_given?

    mapped_array = []
    for value in self do
      mapped_array << (yield value)
    end
    mapped_array
  end

  def my_inject(init)
    return to_enum(:my_inject) unless block_given?

    sum = init
    for value in self do
      sum = yield sum, value
    end
    sum
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    for value in self do
      yield value
    end
    self
  end
end
