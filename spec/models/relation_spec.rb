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

require 'rails_helper'

RSpec.describe Relation, type: :model do
  describe "Create A Relation Between Two Users" do 
  	it "followes a user " do 
  		user_1 = create :user
  		user_2 = create :user, :name => "Aimen"

  		# following = create(:relation, :follower_id => user_1.id, :following_id => user_2.id)
  		expect{ create(:relation, :follower_id => user_1.id, :following_id => user_2.id) }.to change(Relation, :count).by(1)
  	end
  	it "has following relation " do 
  		user_1 = create :user
  		user_2 = create :user, :name => "Aimen"

  		following = create(:relation, :follower_id => user_1.id, :following_id => user_2.id)
  		expect(user_1.following_relations).to include following
  	end
  	it "has a followers relation" do 
  		user_1 = create :user
  		user_2 = create :user, :name => "Aimen"

  		following = create(:relation, :follower_id => user_1.id, :following_id => user_2.id)
  		expect(user_2.follower_relations).to include following
  	end
  	it "returns a user that user_1 is following" do 
  		user_1 = create :user
  		user_2 = create :user, :name => "Aimen"

  		following = create(:relation, :follower_id => user_1.id, :following_id => user_2.id)
  		expect(user_1.followings).to include user_2
  	end

  	it "returns a user that user_1 is following" do 
  		user_1 = create :user
  		user_2 = create :user, :name => "Aimen"

  		following = create(:relation, :follower_id => user_1.id, :following_id => user_2.id)
  		expect(user_1.followers).to be_empty
  	end

  end

end	
