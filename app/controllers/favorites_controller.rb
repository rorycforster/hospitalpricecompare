class FavoritesController < ApplicationController
  before_action(:load_favorite, { only: [:show, :edit, :update, :destroy] })

  private

  def load_favorite
    return @favorite = Favorite.find(params[:id])
  end
end