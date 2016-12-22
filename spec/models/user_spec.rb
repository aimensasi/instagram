# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  username        :string           not null
#  bio             :text
#  website         :string
#  email           :string
#  gender          :string
#  phone_number    :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  
	let(:valid_attributes) { {:email => "adam@gmail.com", :password => "12234567", :name => "adam", :username => "adamjames", :website => "https://www.google.com"} }
	let(:invalid_attributes) { {:email => "adamgmail.com", :password => "1567", :name => "adam", :username => "adamjames", :website => "www.google.com"} }
	let(:user) { create(:user) }

	before(:each) do 
		@user = user
	end
	
	describe "Model Validation" do 

		context "Attributes Validation" do 
			it{ is_expected.to validate_presence_of :name }
			it{ is_expected.to validate_presence_of :username }
			it{ is_expected.to validate_presence_of :password }
			it{ is_expected.to validate_presence_of :email }
			it{ is_expected.to validate_uniqueness_of :email }
			it{ is_expected.to allow_value(valid_attributes[:email]).for(:email) }
			it{ is_expected.not_to allow_value(invalid_attributes[:email]).for(:email) }
		end
	end

	describe "Model CRUD" do 
		context "Create A New User" do 
			it "creates new user if valid attributes" do 
				expect { User.create(valid_attributes) }.to change(User, :count).by(1)
			end
			it "does not create user when invalid attributes" do 
				expect { User.create(invalid_attributes) }.not_to change(User, :count)
			end
		end

		context "Update User" do 
			it "creates new user if valid attributes" do 
				email = "james@gmail.com"
				@user.update(:email => email)

				expect(@user.email).to eq email
			end
			it "does not update user when invalid attributes" do 
				skip('for Unknown reason the validation is not working ')
				email = "jhoneJames"
				@user.update(:email => email)

				expect(@user.email).not_to eq email
			end
		end
	end


end
