# == Schema Information
#
# Table name: rules
#
#  id            :integer          not null, primary key
#  plan_id       :integer          not null
#  ruleable_id   :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ruleable_type :string
#

require 'test_helper'

class RuleTest < ActiveSupport::TestCase
  test "should not validate rule without plan_id" do
    rule = build(:rule, plan_id: nil)
    assert_not rule.valid?
  end

  test "should not validate rule without ruleable_id" do
    rule = build(:rule, ruleable_id: nil)
    assert_not rule.valid?
  end

  test "should not validate rule without ruleable_type" do
    rule = build(:rule, ruleable_type: nil)
    assert_not rule.valid?
  end
end
