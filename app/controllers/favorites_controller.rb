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
    @hospital = Hospital.create(:provider_name => params[:provider_name], :provider_street_address => params[:provider_street_address], :provider_city => params[:provider_city], :provider_state => params[:provider_state], :provider_zip_code => params[:provider_zip_code])
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
        params.require(:provider_name)
        params.require(:provider_street_address)
        params.require(:provider_city)
        params.require(:provider_state)
        params.require(:provider_zip_code)
  end

  def load_favorite
    return @favorite = Favorite.find(params[:id])
  end
end