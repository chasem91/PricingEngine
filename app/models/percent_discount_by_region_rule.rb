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

class PercentDiscountByRegionRule < ApplicationRecord
  validates :region, :percent, presence: true

  has_one :rule, as: :ruleable
end
