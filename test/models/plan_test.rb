# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  company_id :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  test "should not validate plan without company_id" do
    rule = build(:plan, company_id: nil)
    assert_not rule.valid?
  end

  test "should not validate plan without name" do
    rule = build(:plan, name: nil)
    assert_not rule.valid?
  end
end
