# == Schema Information
#
# Table name: base_price_rules
#
#  id         :integer          not null, primary key
#  base_price :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BasePriceRuleTest < ActiveSupport::TestCase
  test "should not validate base_price_rule without base_price" do
    rule = build(:base_price_rule, base_price: nil)
    assert_not rule.valid?
  end
end
