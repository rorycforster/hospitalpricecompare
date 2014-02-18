class HospitalsController < ApplicationController

  def index
    render (:index)
  end

  def search
    HTTParty.get("http://data.cms.gov/resource/97k6-zzx3.json?provider_state=#{params[:provider_state]}&drg_definition=#{params[:drg_definition].gsub(" ","+")}")
  end

  def show
    render(:search)
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