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
#

class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  before_action :require_login, :except => [:new, :create]

  layout 'logged_out', :only => [:new, :create]

  def index
    @users = User.all
  end

  def show
    if @user
      render :show
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def edit
    if @user
      render :edit
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new(create_params)
    if request.xhr?
      if @user.save
        log_in @user
        flash.notice = "Thanks, For Joining Instagram"
        render :json => {:status => 200, :url => root_path}
      else
        render :json => {:status => 400, :message => @user.errors.full_messages.first, :type => "sign-up"} 
      end  
    end
    
  end

  def update
    @user = User.find_by_id(params[:id])
    if request.xhr?
      if update_params.present?

        if @user.update(update_params)
          render :json => {:status => 200, :type => "edit-user", :message => "Profile Saved"}
        else
          puts " Erorr:: #{@user.errors.full_messages}"
          render :json => {:status => 400, :type => "edit-user", :message => "There was a problem saving your profile. Please try again soon."}
        end

      elsif password_params.present?

        if @user.authenticate(password_params[:old_password])
          @user.password = password_params[:new_password]
          if @user.save
            render :json => {:status => 200, :type => "change-password", :message => "Password Changed Successfully"}
          else
            render :json => {:status => 400, :type => "change-password", :message => @user.errors.full_messages.first}  
          end
        else
          render :json => {:status => 400, :type => "change-password", 
                           :message => "Your old password was entered incorrectly. Please enter it again."}
        end
      end  

    end
  end


  def destroy
    @user.destroy
    log_out @user
    redirect_to root_path
  end

  private
    def set_user
      @user = User.find_by_id(params[:id])
    end

    def create_params
      params.require(:user).permit(:name, :username, :email, :password)
    end

    def update_params
      params.require(:user).permit(:name, :username, :email, :website, :bio, :gender, :phone_number)
    end

    def password_params
      params.require(:user).permit(:old_password, :new_password, :confirm_password)
    end
end
