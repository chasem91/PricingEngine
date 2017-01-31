json.name plan.name
json.rules do
  json.min_age_rule do
    json.partial!(
      'api/min_age_rules/rule',
      min_age_rule: plan.min_age_rule
    )
  end
  json.base_price_rule do
    json.partial!(
      'api/base_price_rules/rule',
      base_price_rule: plan.base_price_rule
    )
  end
  json.fixed_discount_by_gender_rule do
    json.partial!(
      'api/fixed_discount_by_gender_rules/rule',
      fixed_discount_by_gender_rule: plan.fixed_discount_by_gender_rule
    )
  end
  json.fixed_increase_by_age_rule do
    json.partial!(
      'api/fixed_increase_by_age_rules/rule',
      fixed_increase_by_age_rule: plan.fixed_increase_by_age_rule
    )
  end
  json.percent_discount_by_region_rule do
    json.partial!(
      'api/percent_discount_by_region_rules/rule',
      percent_discount_by_region_rule: plan.percent_discount_by_region_rule
    )
  end
  json.percent_increase_by_condition_rules do
    json.array!(plan.percent_increase_by_condition_rules) do |rule|
      json.partial!(
        'api/percent_increase_by_condition_rules/rule',
        percent_increase_by_condition_rule: rule
      )
    end
  end
end
