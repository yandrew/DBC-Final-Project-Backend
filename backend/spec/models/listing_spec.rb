require 'rails_helper'
require 'faker'
RSpec.describe Listing, type: :model do
  it "creates a valid listing" do
    listing = FactoryGirl.create(:user_with_listing)
  end
end
