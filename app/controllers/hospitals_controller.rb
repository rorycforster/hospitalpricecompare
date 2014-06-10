class HospitalsController < ApplicationController

  def index
    #get list of procedures to use in drop down menu
    @drg_list = Input.select(:drg_definition).map(&:drg_definition).uniq.sort
  end

  def search
    #display search results based on state and procedure input
    @procedure = (params[:drg_definition]).gsub(" ","%20").gsub("&", "%26")
    @results = HTTParty.get("http://data.cms.gov/resource/97k6-zzx3.json?$order=average_covered_charges%20ASC&provider_state=#{params[:provider_state]}&drg_definition=#{@procedure}&$$app_token=#{SODA_CLIENT_ID}")
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(hospital_params)
  end

  def show
  end
  
  private

  def hospital_params
    params.require(:hospital).permit(:hospital_name, :address_1, :city, :state, :phone_number)
  end

end