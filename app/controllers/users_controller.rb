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
    @user = User.new(user_params)
    # byebug
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
    respond_to do |format|
      if @user.update(user_params)
        format.js { flash.notice = "Profile Saved" }
      else
        format.js { flash.alert = @user.errors.full_messages.first }
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

    def user_params
      params.fetch(:user, {}).permit(:name, :username, :email, :password, :website, :bio, :gender, :phone_number)
    end
end
