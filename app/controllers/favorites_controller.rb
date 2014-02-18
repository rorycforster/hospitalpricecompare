class FavoritesController < ApplicationController
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

  def show
    @favorites.each{|hosp|hosp.listing}
  end

  def destroy
    @favorite.destroy
    session.destroy
    redirect_to user_path
  end


  
  private

  def hospital_params
    params.require(:data).permit(:provider_name, :provider_street_address, :provider_city, :provider_state, :provider_zip_code)
  end
end