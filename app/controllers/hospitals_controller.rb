class HospitalsController < ApplicationController

  def index
    @drg_list = HTTParty.get("http://data.cms.gov/resource/97k6-zzx3.json?$select=drg_definition")
    @drg_list_array = @drg_list.map { |procedure| procedure.values }
    @drg_list_array.uniq!.flatten!
  end

  def search
    @procedure = (params[:drg_definition]).to_s.gsub(" ","+")
    @results = HTTParty.get("http://data.cms.gov/resource/97k6-zzx3.json?$order=average_covered_charges%20ASC&provider_state=#{params[:provider_state]}&drg_definition=#{@procedure}")
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