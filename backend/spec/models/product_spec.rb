require 'rails_helper'
require 'faker'
RSpec.describe Product, type: :model do
  it "creates a valid listing" do
    listing = FactoryGirl.create(:listing_with_product)
  end
end
