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

require 'rails_helper'

describe PercentIncreaseByConditionRule do
  context 'validations' do
    it { should validate_presence_of(:condition) }
    it { should validate_presence_of(:percent) }
  end

  context 'associations' do
    it { should have_one(:rule) }
  end
end
