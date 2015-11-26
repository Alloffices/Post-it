require 'rails_helper'

describe Projx do
	it 'creates a projx' do
		expect(build(:projx)).to be_valid
	end
end

