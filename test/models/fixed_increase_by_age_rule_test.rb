# == Schema Information
#
# Table name: fixed_increase_by_age_rules
#
#  id           :integer          not null, primary key
#  base_age     :integer          not null
#  age_interval :integer          not null
#  amount       :float            not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class FixedIncreaseByAgeRuleTest < ActiveSupport::TestCase
  test "should not validate fixed_increase_by_age_rule without base_age" do
    rule = build(:fixed_increase_by_age_rule, base_age: nil)
    assert_not rule.valid?
  end

  test "should not validate fixed_increase_by_age_rule without amount" do
    rule = build(:fixed_increase_by_age_rule, amount: nil)
    assert_not rule.valid?
  end

  test "should not validate fixed_increase_by_age_rule without age_interval" do
    rule = build(:fixed_increase_by_age_rule, age_interval: nil)
    assert_not rule.valid?
  end
end
