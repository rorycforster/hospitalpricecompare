class FavoritesController < ApplicationController
  before_action(:load_user)

  def index
    @user = User.find_by(id: params[:user_id])
    @favorites = @user.favorites
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user = @user
    @favorite.hospital = @hospital
    @favorite.save

    redirect_to user_favorite_path(@user)
  end

  def show
    @favorites.each{|hosp|hosp.listing}
  end

  def destroy
    @favorite.destroy
    session.destroy
    redirect_to user_path
  end


  
  private
  def load_user
    return @user = User.find_by(id: params[:user_id])
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :hospital_id)
  end
end