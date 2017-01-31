# == Schema Information
#
# Table name: min_age_rules
#
#  id          :integer          not null, primary key
#  minimum_age :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

describe MinAgeRule do
  context 'validations' do
    it { should validate_presence_of(:minimum_age) }
  end

  context 'associations' do
    it { should have_one(:rule) }
  end
end
