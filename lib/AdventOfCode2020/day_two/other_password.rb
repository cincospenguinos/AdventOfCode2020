require_relative 'password'

class OtherPassword < Password
  def valid?
    # [password[index0] == letter, password[index1] == letter]
    #   .map { |l| l }
    #   .select { |l| l }
    #   .count == 1
    (password[index0] == letter && password[index1] != letter) ||
    (password[index0] != letter && password[index1] == letter)
  end

  private

  def index0
    range[0] - 1
  end

  def index1
    range[1] - 1
  end
end