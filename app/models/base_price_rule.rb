# == Schema Information
#
# Table name: base_price_rules
#
#  id         :integer          not null, primary key
#  base_price :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BasePriceRule < ApplicationRecord
  validates :base_price, presence: true

  has_one :rule, as: :ruleable
end
