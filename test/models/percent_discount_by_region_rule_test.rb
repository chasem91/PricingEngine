# == Schema Information
#
# Table name: percent_discount_by_region_rules
#
#  id         :integer          not null, primary key
#  region     :string           not null
#  percent    :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PercentDiscountByRegionRuleTest < ActiveSupport::TestCase
  test "should not validate percent_discount_by_region_rule without region" do
    rule = build(:percent_discount_by_region_rule, region: nil)
    assert_not rule.valid?
  end

  test "should not validate percent_discount_by_region_rule without percent" do
    rule = build(:percent_discount_by_region_rule, percent: nil)
    assert_not rule.valid?
  end
end
