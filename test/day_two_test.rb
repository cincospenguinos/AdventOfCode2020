require 'test_helper'

describe 'DayTwo' do
  it 'indicates which passwords are incorrect' do
    passwords = ['1-3 a: abcde', '1-3 b: cdefg', '2-9 c: ccccccccc']
    day_two = DayTwo.new(passwords)
    assert day_two.valid_passwords.include?('abcde')
    assert day_two.valid_passwords.include?('ccccccccc')
  end
end