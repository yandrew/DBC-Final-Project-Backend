require 'rails_helper'
require 'faker'
RSpec.describe Offer, type: :model do
  it "creates a valid listing" do
    offer = FactoryGirl.create(:user_with_offer)
  end
end
