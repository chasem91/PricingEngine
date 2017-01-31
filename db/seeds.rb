# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

company = Company.create(name: 'Taco Insurance Company of Kentucky and Lower Europe')
plan = Plan.create(name: 'Standard Taco Plan', company_id: company.id)

rules = []

rules << MinAgeRule.create(minimum_age: 18)
rules << BasePriceRule.create(base_price: 100.00)
rules << FixedDiscountByGenderRule.create(gender: 'Female', discount: 12.00)
rules << FixedIncreaseByAgeRule.create(base_age: 18, age_interval: 5, amount: 20.00)
rules << PercentDiscountByRegionRule.create(region: 'East Coast of America', percent: 5.00)
rules << PercentIncreaseByConditionRule.create(condition: 'Allergies', percent: 1.00)
rules << PercentIncreaseByConditionRule.create(condition: 'Sleep Apnea', percent: 6.00)
rules << PercentIncreaseByConditionRule.create(condition: 'Heart Disease', percent: 17.00)
rules << PercentIncreaseByConditionRule.create(condition: 'High Cholesterol', percent: 8.00)
rules << PercentIncreaseByConditionRule.create(condition: 'Asthma', percent: 4.00)

rules.each do |rule|
  Rule.create(plan_id: plan.id, ruleable_id: rule.id, ruleable_type: rule.class.name)
end
