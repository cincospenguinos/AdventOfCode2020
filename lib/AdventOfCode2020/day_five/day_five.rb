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
      row = binary_search(pass[0..6], (0...128).to_a)
      col = binary_search(pass[7...(pass.length)], (0...8).to_a)
      BoardingPass.new(row, col)
    end
  end

  private

  def binary_search(string, values)
    string.split('').each do |val|
      pivot = values.size / 2

      if val == 'F' || val == 'L'
        values = values[0...pivot]
      else
        values = values[pivot..(values.size - 1)]
      end
    end

    values.first
  end
end