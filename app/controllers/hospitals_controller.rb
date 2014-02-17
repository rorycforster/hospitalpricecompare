class HospitalsController < ApplicationController

  def search
    HTTParty.get("http://data.medicare.gov/resource/v287-28n3.json?state=#{params[:state]}&drg_definition=#{params[:drg_definition]}")
  end

  def index
    search
  end

  def show
    listings
  end

end
