# == Schema Information
#
# Table name: relations
#
#  id           :integer          not null, primary key
#  following_id :integer          not null
#  follower_id  :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :relation do
    follower_id 1
    following_id 2
  end
end
