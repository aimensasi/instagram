# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  media      :string           not null
#  caption    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
	belongs_to :user

	validates :media, :presence => true
	validates :user, :presence => true

	mount_uploader :media, AvatarUploader


  def image
	 	return nil unless  media.file.present?
	 	media.cover.url
  end

  def user_pic
  	user.pic
  end

  def username
  	user.username
  end
end
