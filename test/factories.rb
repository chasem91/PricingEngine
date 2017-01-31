FactoryGirl.define do
  factory :base_price_rule do
    base_price 50.00
  end

  factory :fixed_discount_by_gender_rule do
    gender 'Female'
    discount 1.00
  end

  factory :fixed_increase_by_age_rule do
    base_age 18
    age_interval 5
    amount 10.00
  end

  factory :min_age_rule do
    minimum_age 10
  end

  factory :percent_discount_by_region_rule do
    region 'Northwest'
    percent 25.00
  end

  factory :percent_increase_by_condition_rule do
    condition 'Annoying'
    percent 32.00
  end

  factory :company do
    name 'PICKLE'
  end

  factory :plan do
    company_id 23
    name 'Super plan'
  end

  factory :rule do
    plan_id 4
    ruleable_id 423
    ruleable_type 'MinAgeRule'
  end
end
