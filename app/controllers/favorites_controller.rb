class FavoritesController < ApplicationController
  before_action :load_favorite, only: [:show, :edit, :update, :destroy]
  def index
    @user = User.find(session[:user_id])
    @favorites = @user.favorites
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @hospital = Hospital.create(hospital_params)
    @favorite = Favorite.create(hospital_id: @hospital.id, user_id: session[:user_id])
    redirect_to user_favorites_path(session(:user_id))
  end

  def destroy
    @favorite.destroy
    redirect_to user_favorites_path(session(:user_id))
  end
  
  private

  def hospital_params
    params.require(:data).permit(:provider_name, :provider_street_address, :provider_city, :provider_state, :provider_zip_code)
  end
  
  def load_favorite
    return @favorite = Favorite.find(params[:id])
  end
end