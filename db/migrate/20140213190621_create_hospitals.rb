class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.text :provider_name
      t.text :provider_street_address
      t.string :provider_city
      t.string :provider_state
      t.string :provider_zip_code
    end
  end
end
