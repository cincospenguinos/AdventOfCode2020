class Password
  attr_reader :range, :letter, :password

  def initialize(line)
    split = line.split(' ')
    @range = split[0].split('-').map(&:to_i)
    @letter = split[1].gsub(':', '')
    @password = split[2].chomp
  end

  def valid?
    count = password.split('')
      .map { |l| l == letter ? l : nil }
      .reject(&:nil?)
      .count

    count >= range[0] && count <= range[1]
  end
end