class CreateInputs < ActiveRecord::Migration
  def change
    create_table :inputs do |t|
      t.text :drg_definition
      t.text :provider_id
      t.text :provider_name
      t.text :provider_street_address
      t.text :provider_city
      t.text :provider_state
      t.text :provider_zip_code
      t.text :hospital_referral_region_hrr_description
      t.text :total_discharges
      t.text :average_covered_charges
      t.text :average_total_payments
      t.text :average_medicare_payments
    end
  end
end
