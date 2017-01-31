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

require 'rails_helper'

describe Plan do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:company_id) }
  end

  context 'associations' do
    it { should have_many(:rules) }
    it { should belong_to(:company) }
    it { should have_one(:min_age_rule) }
    it { should have_one(:base_price_rule) }
    it { should have_one(:fixed_increase_by_age_rule) }
    it { should have_one(:fixed_discount_by_gender_rule) }
    it { should have_one(:percent_discount_by_region_rule) }
    it { should have_many(:percent_increase_by_condition_rules) }
  end
end
