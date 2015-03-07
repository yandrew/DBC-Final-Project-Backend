require 'rails_helper'
require 'faker'

RSpec.describe Bid, type: :model do
  it "creates a valid bid" do
    bid = FactoryGirl.create(:listing_with_bid)
  end
end


