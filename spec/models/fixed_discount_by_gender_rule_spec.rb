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

require 'rails_helper'

describe FixedDiscountByGenderRule do
  context 'validations' do
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:discount) }
  end

  context 'associations' do
    it { should have_one(:rule) }
  end
end
