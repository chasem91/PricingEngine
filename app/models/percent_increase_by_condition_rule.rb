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

class PercentIncreaseByConditionRule < ApplicationRecord
  validates :condition, :percent, presence: true

  has_one :rule, as: :ruleable
end
