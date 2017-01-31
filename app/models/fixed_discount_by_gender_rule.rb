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

class FixedDiscountByGenderRule < ApplicationRecord
  validates :gender, :discount, presence: true

  has_one :rule, as: :ruleable
end
