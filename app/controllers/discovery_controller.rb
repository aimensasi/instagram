class DiscoveryController < ApplicationController

	def index
		@users = User.unFollowed current_user.followings
	end

	def search 
		# byebug
		@users = User.by_username(params[:query])

		respond_to do |format|
			format.js
		end
	end
end
