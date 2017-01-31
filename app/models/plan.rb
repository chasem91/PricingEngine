# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  company_id :integer          not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Plan < ApplicationRecord
  validates :company_id, :name, presence: true

  belongs_to :company
  has_many :rules

  has_one :min_age_ruling,
    -> { where ruleable_type: 'MinAgeRule' },
    class_name: 'Rule'

  has_one :min_age_rule,
    through: :min_age_ruling,
    source: :ruleable,
    source_type: 'MinAgeRule'

  has_one :base_price_ruling,
    -> { where ruleable_type: 'BasePriceRule' },
    class_name: 'Rule'

  has_one :base_price_rule,
    through: :base_price_ruling,
    source: :ruleable,
    source_type: 'BasePriceRule'

  has_one :fixed_discount_by_gender_ruling,
    -> { where ruleable_type: 'FixedDiscountByGenderRule' },
    class_name: 'Rule'

  has_one :fixed_discount_by_gender_rule,
    through: :fixed_discount_by_gender_ruling,
    source: :ruleable,
    source_type: 'FixedDiscountByGenderRule'

  has_one :fixed_increase_by_age_ruling,
    -> { where ruleable_type: 'FixedIncreaseByAgeRule' },
    class_name: 'Rule'

  has_one :fixed_increase_by_age_rule,
    through: :fixed_increase_by_age_ruling,
    source: :ruleable,
    source_type: 'FixedIncreaseByAgeRule'

  has_one :percent_discount_by_region_ruling,
    -> { where ruleable_type: 'PercentDiscountByRegionRule' },
    class_name: 'Rule'

  has_one :percent_discount_by_region_rule,
    through: :percent_discount_by_region_ruling,
    source: :ruleable,
    source_type: 'PercentDiscountByRegionRule'

  has_many :percent_increase_by_condition_rulings,
    -> { where ruleable_type: 'PercentIncreaseByConditionRule' },
    class_name: 'Rule'

  has_many :percent_increase_by_condition_rules,
    through: :percent_increase_by_condition_rulings,
    source: :ruleable,
    source_type: 'PercentIncreaseByConditionRule'
end
