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

class Rule < ApplicationRecord
  validates :plan_id, :ruleable_id, :ruleable_type, presence: true

  belongs_to :plan
  belongs_to :ruleable, polymorphic: true
end
