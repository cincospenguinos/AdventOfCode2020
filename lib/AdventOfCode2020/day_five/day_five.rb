class DayFive
  def initialize(passes)
    @passes = passes
  end

  class BoardingPass
    attr_reader :row, :col

    def initialize(row, col)
      @row = row.size == 2 ? row[0] : row
      @col = col
    end

    def id
      row * 8 + col
    end
  end

  def passes
    @passes.map do |pass|
      row = (0..128).to_a

      pass[0..6].split('').each do |val|
        pivot = row[row.size / 2]

        if val == 'F'
          row = row.reject { |r| r > pivot }
        else
          row = row.reject { |r| r < pivot }
        end
      end

      BoardingPass.new(row, nil)
    end
  end
end