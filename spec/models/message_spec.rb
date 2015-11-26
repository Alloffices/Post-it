require 'rails_helper'

describe Message do
	it 'has a valid factory' do
		expect(build(:message)).to be_valid
	end

end