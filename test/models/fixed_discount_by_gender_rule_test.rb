# == Schema Information
#
# Table name: fixed_discount_by_gender_rules
#
#  id         :integer          not null, primary key
#  gender     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  discount   :float
#

require 'test_helper'

class FixedDiscountByGenderRuleTest < ActiveSupport::TestCase
  test "should not validate fixed_discount_by_gender_rule without gender" do
    rule = build(:fixed_discount_by_gender_rule, gender: nil)
    assert_not rule.valid?
  end

  test "should not validate fixed_discount_by_gender_rule without discount" do
    rule = build(:fixed_discount_by_gender_rule, discount: nil)
    assert_not rule.valid?
  end
end
