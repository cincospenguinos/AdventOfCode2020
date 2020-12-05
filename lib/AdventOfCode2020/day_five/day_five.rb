class DayFive
  def initialize(passes)
    @passes = passes
  end

  class BoardingPass
    attr_reader :row, :col

    def initialize(row, col)
      @row = row
      @col = col
    end

    def id
      row * 8 + col
    end
  end

  def passes
    @passes.map do |pass|
      rows = (0...128).to_a
      row = binary_search(pass[0..6], rows)
      cols = (0...8).to_a
      BoardingPass.new(row, nil)
    end
  end

  private

  def binary_search(string, values)
    string.split('').each do |val|
      pivot = values.size / 2

      if val == 'F'
        values = values[0...pivot]
      else
        values = values[pivot..(values.size - 1)]
      end
    end

    values.first
  end
end