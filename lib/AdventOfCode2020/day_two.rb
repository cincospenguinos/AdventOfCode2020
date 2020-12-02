class DayTwo
  attr_reader :passwords

  def initialize(passwords)
    @passwords = passwords
    @valid_passwords = nil
  end

  def valid_passwords
    return @valid_passwords unless @valid_passwords.nil?

    mapping = passwords.map do |password|
      split = password.split(/\s+/)
      first_split = split[0].gsub('-', ' ').split(' ').map(&:to_i)
      letter = split[1].gsub(':', '')
      password = split[2].chomp

      regex = /\A.*#{letter}{#{first_split[0].to_i},#{first_split[1].to_i}}.*\z/

      unless (regex =~ password).nil?
        password
      else
        nil
      end
    end

    mapping.reject(&:nil?)
  end
end