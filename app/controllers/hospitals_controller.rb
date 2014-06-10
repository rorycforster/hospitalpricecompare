class HospitalsController < ApplicationController

  def index
    #get list of procedures to use in drop down menu
    @drg_list = Input.select(:drg_definition).map(&:drg_definition).uniq.sort
  end

  def search
    #display search results based on state and procedure input
    @results = Input.where("drg_definition = ? AND provider_state = ?", params[:drg_definition], params[:provider_state])
    @results.sort! {|a,b| a["average_covered_charges"].to_i<=>b["average_covered_charges"].to_i}
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
    params.require(:hospital).permit(:provider_name, :provider_street_address, :provider_city, :provider_state, :provider_zip_code)
  end

end