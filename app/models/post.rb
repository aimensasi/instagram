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
  has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy

	validates :media, :presence => true
	validates :user, :presence => true

	mount_uploader :media, PostImg

  scope :recent, -> { order(:created_at => :ASC) }

  def image
	 	return nil unless  media.file.present?
	 	media.cover.url
  end

  def thumbnail
    return nil unless  media.file.present?
    media.thumbnail.url
  end

  def user_pic
  	user.pic
  end

  def username
  	user.username
  end

  def recent_comments
    comments.order(:created_at => :DESC).limit(5)
  end

  def user_like user
    likes.where(:user_id => user.id).first
  end
end
