require 'spec_helper'

describe "Listing Todo Lists" do
	it "requires login" do
		visit "/todo_lists"
		expect(page).to have_content("You must be logged in")
	end
end