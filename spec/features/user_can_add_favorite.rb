require 'spec_helper'

describe 'a user can add a favorite hospital' do
  let(:user) { FactoryGirl.create(:user) }

  it "will add a hospital to favorites" do
    login(user)
    click_link "Search Hospitals"
    fill_in "provider_state", with: "NY"
    select("039 - EXTRACRANIAL PROCEDURES W/O CC/MCC", :from => "drg_definition")
    click_button "Search"
    first(:button, "Favorite").click

    expect(page).to have_button "Delete"
  end

def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in"
end

end