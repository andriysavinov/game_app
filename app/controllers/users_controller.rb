class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  def home
  end
  def new
  	@user = User.new
  end
  def edit
    @user = User.find(params[:id])
  end
  def show
    @user = User.find(params[:id])
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
  		redirect_to @user
  	else
  		render '_error_messages'
  	end
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end
  private
  def user_params
  	params.require(:user).permit(:name, :surname, :age, :email, :password, :password_confirmation, :sex, :phone, :status)
  end
  def signed_in_user
    unless signed_in?
      redirect_to signin_url, notice: 'Please sign in.'
    end
  end
end
