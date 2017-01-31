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

require 'rails_helper'

describe FixedIncreaseByAgeRule do
  context 'validations' do
    it { should validate_presence_of(:base_age) }
    it { should validate_presence_of(:age_interval) }
    it { should validate_presence_of(:amount) }
  end

  context 'associations' do
    it { should have_one(:rule) }
  end
end
