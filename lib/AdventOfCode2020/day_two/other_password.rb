require_relative 'password'

class OtherPassword < Password
  def valid?
    first_valid = password[index0] == letter
    second_valid = password[index1] == letter

    (first_valid && !second_valid) || (!first_valid && second_valid)
  end

  private

  def index0
    range[0] - 1
  end

  def index1
    range[1] - 1
  end
end