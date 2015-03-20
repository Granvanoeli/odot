require 'spec_helper'

describe "User" do

let(:valid_attributes) {
	{
		first_name: "Sarah",
		last_name: "McLaughlin",
		email: "sarah.mclaughlin@gmail.com",
		password: "supersecure123",
		password_confirmation: "supersecure123"
	}
}

  context "validations" do
  	let(:user) { User.new(valid_attributes) }

  	before do
  		User.create(valid_attributes)
  	end

  	it "requires an email" do
  		expect(user).to validate_presence_of(:email)
  	end

  	it "requires unique email" do 
  		expect(user).to validate_uniqueness_of(:email)
	end

	it "requires a unique email(case insensitive" do
		user.email = "SARAH.MCLAUGHLIN@GMAIL.COM"
		expect(user).to validate_uniqueness_of(:email)
	end

	it "requires user email to look like an email" do
		user.email = "sarah"
		expect(user).to_not be_valid
	end

  end

  context "#downcase_email" do
  	it "makes the email attribute lower case" do
  		user = User.new(valid_attributes.merge(email: "SARAH.MCLAUGHLIN@GMAIL.COM"))
  		expect { user.downcase_email }.to change{ user.email }.
  			from("SARAH.MCLAUGHLIN@GMAIL.COM").
  			to("sarah.mclaughlin@gmail.com")


  	end

  	
	it "downcases an email before saving" do
		user = User.new(valid_attributes)
		user.email = "SARAH.MCLAUGHLIN@GMAIL.COM"
		expect(user.save).to be_truthy
		expect(user.email).to eq("sarah.mclaughlin@gmail.com")
	end
  end
end
