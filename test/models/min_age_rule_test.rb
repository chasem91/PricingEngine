# == Schema Information
#
# Table name: min_age_rules
#
#  id          :integer          not null, primary key
#  minimum_age :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class MinAgeRuleTest < ActiveSupport::TestCase
  test "should not validate min_age_rule without minimum_age" do
    rule = build(:min_age_rule, minimum_age: nil)
    assert_not rule.valid?
  end
end
