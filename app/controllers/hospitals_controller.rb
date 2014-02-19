class HospitalsController < ApplicationController

  def index
    @drg_list = HTTParty.get("http://data.cms.gov/resource/97k6-zzx3.json?$select=drg_definition")
    @drg_list_array = []
    @drg_list.map { |procedure| @drg_list_array << procedure.values }
    @drg_list_array.uniq.flatten!
    render(:index)
  end


  def search

    @procedure = (params[:drg_definition]).to_s.gsub(" ","+")
    @results = HTTParty.get("http://data.cms.gov/resource/97k6-zzx3.json?$order=average_covered_charges%20ASC&provider_state=#{params[:provider_state]}&drg_definition=#{@procedure}")
    #render(:search)
  end

  def new
    @hospital = Hospital.new

  end

  def create
    @hospital = Hospital.new(hospital_params)
  end

  def hospital_params
    params.require(:hospital).permit(:hospital_name, :address_1, :city, :state, :phone_number)
  end

  def show
  end

  #def listing(provider_id)
    #provider_id = "0" + provider_id.to_s
    #hospital_info = HTTParty.get("http://data.medicare.gov/resource/v287-28n3.#json?provider_number=#{provider_id}")
    #puts hospital_info[0]["hospital_name"]
    #puts hospital_info[0]["address_1"]
    #puts "#{hospital_info[0]["city"]}, #{hospital_info[0]["state"]}"
    #puts hospital_info[0]["phone_number"]["phone_number"]
  #end

end