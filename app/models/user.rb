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
#  avatar          :string
#

class User < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

	has_secure_password

	has_many :posts, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	has_many :likes, :dependent => :destroy

	

	# Get People That Admire Me
	has_many :follower_relations, :foreign_key => 'following_id', :class_name => 'Relation'
	#Get The Followers User Object Not The Relation Object
	has_many :followers, :through => :follower_relations, :source => :follower

	# Get People That I admire
	has_many :following_relations, :foreign_key => 'follower_id', :class_name => 'Relation'
	#Get The User Object of The People That I Admire 
	has_many :followings, :through => :following_relations, :source => :following




	validates_presence_of :name, :username, :email
	validates :email, :uniqueness => true, :format => { with: EMAIL_REGEX, message: "Invalid Email"}
	validates :password, :presence => true, :on => :create
	validates :password, :length => {:minimum => 6, :maximum => 70 }, :allow_blank => true
	


  def profile_pic
	 	return nil unless  avatar.file.present?
	 	avatar.thumbnail.url
  end

  def pic
	 	return nil unless  avatar.file.present?
	 	avatar.thumbnail_small.url
  end
	
end
