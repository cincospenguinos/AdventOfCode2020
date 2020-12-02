class DayTwo
  attr_reader :passwords

  def initialize(passwords)
    @passwords = passwords
    @valid_passwords = nil
  end

  def valid_passwords
    return @valid_passwords unless @valid_passwords.nil?

    mappings = passwords.map do |line|
      split = line.split(' ')
      range = split[0].split('-').map(&:to_i)
      letter = split[1].gsub(':', '')
      password = split[2].chomp

      amt = password.split('')
        .map { |l| l == letter }
        .select { |t| t }
        .count

      if amt >= range[0] && amt <= range[1]
        password
      else
        nil
      end
    end

    mappings.reject(&:nil?)
  end
end