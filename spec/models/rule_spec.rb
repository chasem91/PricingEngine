# == Schema Information
#
# Table name: rules
#
#  id            :integer          not null, primary key
#  plan_id       :integer          not null
#  ruleable_id   :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ruleable_type :string
#

require 'rails_helper'

describe Rule do
  context 'validations' do
    it { should validate_presence_of(:plan_id)}
    it { should validate_presence_of(:ruleable_id)}
    it { should validate_presence_of(:ruleable_type)}
  end

  context 'associations' do
    it { should belong_to(:ruleable) }
    it { should belong_to(:plan) }
  end
end
