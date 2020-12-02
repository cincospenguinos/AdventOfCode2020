class NumberSearch
  attr_reader :day

  def initialize(day)
    @day = day
  end

  def meta_search(index)
    while day.indexes[index] < day.list.size do
      if day.indexes[index + 1] == day.indexes[-1]
        did_find = search_within(index + 1) { matches_criteria }
      else
        did_find = meta_search(index + 1)
      end

      if did_find
        @numbers = day.current_values
        return true
      end

      day.indexes[index] += 1
      day.indexes[index + 1] = day.indexes[index] + 1
    end

    false
  end

  def search_within(index)
    while day.indexes[index] < day.list.size do
      if yield
        return true
      else
        day.indexes[index] += 1
      end
    end

    false
  end

  private

  def matches_criteria
    day.current_values.inject(:+) == 2020
  end
end