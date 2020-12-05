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
    ids = DayFive.new([example]).passes.map(&:id)
    assert ids[0] == 357
  end
end