require 'rails_helper'

feature 'user registers successfully' do
	scenario 'succesfully' do
		visit '/users/sign_up'

		fill_in 'username', :with => 'username'
		fill_in 'email', :with => 'example@email.com'
		fill_in 'password', :with => 'password'
		fill_in 'password confirmation', :with => 'password'
		click_button 'Done'

		expect(page).to have_content 'Welcome! You have signed up successfully'
	end
end