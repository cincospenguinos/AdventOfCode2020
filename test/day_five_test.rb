require 'test_helper'

describe 'DayFive' do
  example = 'FBFBBFFRLR'

  it 'handles rows correctly' do
    passes = DayFive.new([example]).passes
    assert passes[0].row == 44
  end

  it 'handles columns correctly' do
    passes = DayFive.new([example]).passes
    assert passes[0].col == 5
  end

  it 'properly calculates ids' do
    ids = DayFive.new([example]).ids
    assert ids[0] == 357
  end

  it 'solves part one' do
    passes = File.read('data/day5.txt').split(/\s+/).map(&:chomp)
    ids = DayFive.new(passes).ids
    assert ids.max == 828
  end

  it 'solves part two' do
    passes = File.read('data/day5.txt').split(/\s+/).map(&:chomp)
    ids = DayFive.new(passes).ids.sort
    index = ids.each_with_index
      .map { |val, index| ids[index + 1] == val + 2 }
      .index(true)
    assert ids[index] + 1 == 565
  end
end