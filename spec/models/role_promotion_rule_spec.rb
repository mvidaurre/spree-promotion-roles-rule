require 'spec_helper'

describe "Admin role promotion" do
  before :each do
    # rule only for admin role
    @rule = RolesPromotionRule.new
    @rule.role_list = [create(:admin_role).id]
    @order = create(:order)
  end

  it "is only eligible for 1 user" do
    expect(@rule.role_list.count).to eq 1
  end

  it "is eligible for admin user" do
    @order.user = create(:admin_user)
    expect(@rule.eligible?(@order)).to be true
  end

  it "is not eligible for other users" do
    expect(@rule.eligible?(@order)).to be false
  end
end