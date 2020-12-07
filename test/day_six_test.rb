require 'test_helper'

describe 'DaySix' do
	it 'handles a group of one' do
		groups = ['abc']
		assert DaySix.new(groups).count == 3
	end
end