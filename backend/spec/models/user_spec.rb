require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  it "creates a valid user" do
  	User.destroy_all
    user = FactoryGirl.create(:user)
    expect(User.last).to eq(user)
  end
end


