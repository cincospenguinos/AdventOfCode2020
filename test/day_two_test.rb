require 'test_helper'

describe 'DayTwo' do
  it 'indicates which passwords are incorrect' do
    passwords = ['1-3 a: abcde', '1-3 b: cdefg', '2-9 c: ccccccccc']
    day_two = DayTwo.new(passwords)
    assert day_two.valid_passwords.include?('abcde')
    assert day_two.valid_passwords.include?('ccccccccc')
  end

  it 'captures passwords with too many letters' do
    passwords = ['1-3 a: abacadae']
    assert DayTwo.new(passwords).valid_passwords.size == 0
  end

  it 'passes part one' do
    passwords = File.read('data/day2.txt').split("\n").map(&:chomp)
    assert DayTwo.new(passwords).valid_passwords.size == 528
  end
end