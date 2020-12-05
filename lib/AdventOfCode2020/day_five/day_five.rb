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
      rows = (0..128).to_a

      row = binary_search(pass[0..6], rows)
      BoardingPass.new(row, nil)
    end
  end

  private

  def binary_search(string, values)
    string.split('').each do |val|
      pivot = values[values.size / 2]

      if val == 'F'
        values = values.reject { |r| r > pivot }
      else
        values = values.reject { |r| r < pivot }
      end
    end

    values = values[0] if values.size == 2
    values
  end
end