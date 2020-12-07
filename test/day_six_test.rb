require 'test_helper'

describe 'DaySix' do
	it 'handles a group of one' do
		groups = ['abc']
		assert DaySix.new(groups).count == 3
	end

	it 'handles a group of two' do
		groups = ['a ab']
		assert DaySix.new(groups).count == 2
	end

	it 'handles a group of three' do
		groups = ['a ab cdg']
		assert DaySix.new(groups).count == 5
	end
end