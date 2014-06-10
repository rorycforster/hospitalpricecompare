class FavoritesController < ApplicationController
  before_action :load_favorite, only: [:show, :edit, :update, :destroy]
  

  def index
    #view favorites
    @user = User.find(session[:user_id])
    @favorites = @user.favorites
  end

  def new
    @favorite = Favorite.new
  end

  def create
    #add a hospital to favorites
    @hospital = Hospital.create(hospital_params)
    @favorite = Favorite.create(hospital_id: @hospital.id, user_id: session[:user_id])
    redirect_to user_favorites_path(session(:user_id))
  end

  def destroy
    #delete a hospital from favorites
    @favorite.destroy
    redirect_to user_favorites_path(session(:user_id))
  end
  
  private

  def hospital_params
    params
  end
  
  def load_favorite
    return @favorite = Favorite.find(params[:id])
  end
end