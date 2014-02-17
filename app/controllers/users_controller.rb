class UsersController < ApplicationController

  before_action :load_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new

    render(:new)
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def show
    render(:show)
  end

  def index
  end

  def edit
    @update_worked = true
  end

  def destroy
    @user.destroy
    session.destroy
    redirect_to root_path
  end
  
  private

  def load_user
    return @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :dob, :gender, :email, :password, :password_confirmation)
  end
end