module SessionsHelper

	def require_login
		unless current_user
			redirect_to sign_up_path
		end
	end

	def require_new
		if logged_in?
			redirect_to sign_up_path
		end
	end

	def logged_in?
		return nil unless current_user.present?
	end

	def current_user
		User.find_by_id(session[:user_id])
	end

	def log_in user
		session[:user_id] = user.id unless user.nil?
	end

	def is_owner user
		if user.eql? current_user
			true
		else
			false
		end
	end

	def log_out
		session[:user_id] = nil
		redirect_to sign_up_path
	end


end
