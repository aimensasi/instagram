require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  let(:valid_attributes) { 
    {:email => "adam@gmail.com", :password => "12234567", :name => "adam", :username => "adamjames", :website => "https://www.google.com"} 
  }
  
  let(:invalid_attributes) { 
    {:email => "adamgmail.com", :password => "1567", :name => "adam", :username => "adamjames", :website => "www.google.com"} 
  }

  let(:user) { create(:user) }

  before(:each) do 
    @user = user 
    session[:user_id] = @user.id
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all users as @users" do
      get :index, params: {}
      expect(assigns(:users)).to include(@user)
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      get :show, params: {id: @user.to_param}
      expect(assigns(:user)).to eq(user)
    end
    it "render user profile" do
      get :show, params: {id: @user.to_param}
      expect(response).to render_template(:show)
    end
    it "redirect to root url if not found" do 
      get :show, params: {id: 19}
      expect(response).to redirect_to(root_path)
    end
  end

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, params: {}, session: valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
    it "render new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      get :edit, params: {id: user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: {user: valid_attributes}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user and display flash notice" do
        post :create, params: {user: valid_attributes}
        expect(assigns(:user)).to be_a(User)
        expect(flash.notice).to eq "Thanks, For Joining Instagram"
      end

      it "redirects to the created user" do
        post :create, params: {user: valid_attributes}
        expect(response).to redirect_to(User.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, params: {user: invalid_attributes}
        expect(assigns(:user)).to be_a_new(User)
        expect(assigns(:user)).not_to be_valid
      end

      it "re-renders the 'new' template" do
        post :create, params: {user: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  xdescribe "PUT #update" do
    skip("Respond_to says unknown format ")
    context "with valid params" do

      it "updates the requested user" do
        email = "adam@yahoo.com"
        put :update, params: {id: @user.to_param, user: {:email => email}}
        user.reload
        expect(assigns(:user).email).to eq email
      end

      it "assigns the requested user as @user" do
        email = "adam@yahoo.com"
        params = {
          :id => @user.to_param,
          :user => {:email => email},
          format: :js
        }
        
        put :update, params
        expect(assigns(:user)).to eq(@user)
      end
    end

    xcontext "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested user" do
      expect {
        delete :destroy, params: {id: @user.to_param}
      }.to change(User, :count).by(-1)
    end
  end

end
