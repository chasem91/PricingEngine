class Api::CompaniesController < ApplicationController

  def index
    @companies = Company.includes(
      {
        plans: [
          :min_age_rule,
          :base_price_rule,
          :fixed_increase_by_age_rule,
          :fixed_discount_by_gender_rule,
          :percent_discount_by_region_rule,
          :percent_increase_by_condition_rules
        ]
      }
    ).all
    render "api/companies/index"
  end

	private
	def comment_params
		params.require(:company).permit(:id)
	end
end
