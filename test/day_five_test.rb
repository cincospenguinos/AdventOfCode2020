require 'test_helper'

describe 'DayFive' do
  example = 'FBFBBFFRLR'

  it 'handles rows correctly' do
    passes = DayFive.new([example]).passes
    assert passes[0].row == 44
  end
end