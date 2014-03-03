require 'spec_helper'

describe Favorite do
  it { should belong_to (:user) }
  it { should belong_to (:hospital) }
end