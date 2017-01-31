# == Schema Information
#
# Table name: base_price_rules
#
#  id         :integer          not null, primary key
#  base_price :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe BasePriceRule do
  context 'validations' do
    it { should validate_presence_of(:base_price) }
  end

  context 'associations' do
    it { should have_one(:rule) }
  end
end
