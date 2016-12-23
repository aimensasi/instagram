class SessionsController < ApplicationController
  before_action :require_login, :except => [:create]
  before_action :require_new, :only => [:create]
  
  layout 'logged_out'


  def create
  	@user = User.find_by(:email => user_params[:email])

    if request.xhr?      
      if @user.present? && @user.authenticate(user_params[:password])
        log_in @user
        render :json => {:status => 200, :url => root_path}
      else
        render :json => {:status => 400, :message => "Invalid email or password", :type => "log-in"} 
      end  
    end
  end

  def destroy
    log_out
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
