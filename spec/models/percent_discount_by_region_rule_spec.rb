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

require 'rails_helper'

describe PercentDiscountByRegionRule do
  context 'validations' do
    it { should validate_presence_of(:region) }
    it { should validate_presence_of(:percent) }
  end

  context 'associations' do
    it { should have_one(:rule) }
  end
end
