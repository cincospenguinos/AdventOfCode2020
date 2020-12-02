require_relative 'password'

class DayTwo
  attr_reader :passwords

  def initialize(passwords)
    @passwords = passwords
    @valid_passwords = nil
  end

  def valid_passwords
    return @valid_passwords unless @valid_passwords.nil?

    passwords.map { |line| Password.new(line) }
      .select(&:valid?)
      .map(&:password)
  end
end