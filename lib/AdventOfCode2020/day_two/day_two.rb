require_relative 'password'
require_relative 'other_password'

class DayTwo
  attr_reader :passwords, :klass

  def initialize(passwords, klass = 'Password')
    @passwords = passwords
    @valid_passwords = nil
    @klass = klass
  end

  def valid_passwords
    return @valid_passwords unless @valid_passwords.nil?

    passwords.map { |line| Object.const_get(klass).new(line) }
      .select(&:valid?)
      .map(&:password)
  end
end