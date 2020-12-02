require_relative 'password'

class OtherPassword < Password
  def valid?
    [first, second]
      .map { |l| l == letter ? true : nil }
      .reject(&:nil?)
      .count == 1
  end

  private

  def first
    password[index0]
  end

  def second
    password[index1]
  end

  def index0
    range[0] - 1
  end

  def index1
    range[1] - 1
  end
end