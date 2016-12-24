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

	validates_presence_of :name, :username, :email
	validates :email, :uniqueness => true, :format => { with: EMAIL_REGEX, message: "Invalid Email"}
	validates :password, :presence => true, :on => :create
	validates :password, :length => {:minimum => 6, :maximum => 70 }
	


  def profile_pic
	 	return nil unless  avatar.file.present?
	 	avatar.thumbnail.url
  end

  def pic
	 	return nil unless  avatar.file.present?
	 	avatar.thumbnail_small.url
  end
	
end
