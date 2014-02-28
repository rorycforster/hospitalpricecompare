require 'spec_helper'

describe User do
  it { should have_many(:favorites) }
  it { should have_many(:hospitals).through(:favorites) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:dob) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:email) }

  


end