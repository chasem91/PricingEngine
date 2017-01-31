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

class FixedIncreaseByAgeRule < ApplicationRecord
  validates :base_age, :age_interval, :amount, presence: true

  has_one :rule, as: :ruleable
end
