require 'rails_helper'

feature "user visits root path", %{

	As a user,
	I want to home page.
} do
	
	# User Profile Criteria
	#
	# [] I visit root path
	# [] I can see a Sign-in link
	# [] I can see a Register link
	# [] I can see a image

	describe "\n user visits root path" do
		#it or scenario
		scenario "scenario: visits root path" do

			visit root_path

			expect(page).to have_link("NOBBBLE")
			expect(page).to have_link("Register")
			expect(page).not_to have_content("errors")
			expect(page).to have_link("")
			expect(page).to have_css("img")
		end
	end
end