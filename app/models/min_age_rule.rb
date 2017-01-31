# == Schema Information
#
# Table name: min_age_rules
#
#  id          :integer          not null, primary key
#  minimum_age :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MinAgeRule < ApplicationRecord
  validates :minimum_age, presence: true

  has_one :rule, as: :ruleable
end
