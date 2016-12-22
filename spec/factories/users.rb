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

FactoryGirl.define do
  factory :user do
  	name "Adam"  
  	username "james"
  	sequence (:email) {|n| "Adam#{n}@gmail.com"}
  	password "123123123"
  end
end
