class DayTwo
  attr_reader :passwords

  def initialize(passwords)
    @passwords = passwords
    @valid_passwords = nil
  end

  class Password
    attr_reader :password

    def initialize(line)
      split = line.split(/\s+/)
      @range = split[0].gsub('-', ' ').split(' ').map(&:to_i)
      @letter = split[1].gsub(':', '')
      @password = split[2].chomp
    end

    def regex
      /\A.*#{@letter}{#{@range[0]},#{@range[1]}}.*\z/
    end

    def valid?
      !(regex =~ password).nil?
    end
  end

  def valid_passwords
    return @valid_passwords unless @valid_passwords.nil?

    mapping = passwords.map do |password|
      validation = Password.new(password)

      if validation.valid?
        validation.password
      else
        nil
      end
    end

    mapping.reject(&:nil?)
  end
end