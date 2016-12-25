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

class Relation < ApplicationRecord
	belongs_to :follower, :foreign_key => :follower_id, :class_name => 'User'
	belongs_to :following, :foreign_key => :following_id, :class_name => 'User'

	validates_presence_of :follower, :following
	validates :follower, :uniqueness => {:scope => :following}
end
