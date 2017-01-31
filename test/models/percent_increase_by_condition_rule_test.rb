# == Schema Information
#
# Table name: percent_increase_by_condition_rules
#
#  id         :integer          not null, primary key
#  condition  :string           not null
#  percent    :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PercentIncreaseByConditionRuleTest < ActiveSupport::TestCase
  test "should not validate percent_increase_by_condition_rule without condition" do
    rule = build(:percent_increase_by_condition_rule, condition: nil)
    assert_not rule.valid?
  end

  test "should not validate percent_increase_by_condition_rule without percent" do
    rule = build(:percent_increase_by_condition_rule, percent: nil)
    assert_not rule.valid?
  end
end
