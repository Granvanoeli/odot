require 'spec_helper'

describe "Signing Up" do 
	it "allows users to sign up for the site and creates the relative object in the database" do
		expect(User.count).to eq(0)

		visit "/"
		expect(page).to have_content("Sign Up")
		click_link "Sign Up"

		fill_in "First Name", with: "Sarah"
		fill_in "Last Name", with: "Balala"
		fill_in "Email", with: "sarah.mclaughlin@gmail.com"
		fill_in "Password", with: "supersecure123"
		fill_in "Password (again)", with: "supersecure123"
		click_button "Sign Up"

		expect(User.count).to eq(1)
	end
end
	
