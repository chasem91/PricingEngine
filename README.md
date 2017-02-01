### Insurance Pricing Engine

#### Description:
This pricing engine outputs an estimated price for a user given a particular plan's pricing scheme and user info.

Each insurance plan has multiple rules(a 'rule' is can be thought of as a type of calculation in finding a user's estimated price), but only a 'base price rule' is required to make a valid calculation. A plan can also define a number of rules to alter its pricing scheme.

Each rule is defined as a model. It is the job of the frontend to use the data associated with a given plan to calculate the price. Associating different 'rules' with a plan allows for easily adding another type of calculation in any plan's pricing schema.

For example, one plan may have two different rules for
increasing the overall cost by a given percentage along with a base price rule:
```ruby
  company = Company.create(name: 'Taco Insurance Company of Kentucky and Lower Europe')
  plan = Plan.create(name: 'Standard Taco Plan', company_id: company.id)

  rules = []

  rules << BasePriceRule.create(base_price: 100.00)
  rules << PercentIncreaseByConditionRule.create(condition: 'Sleep Apnea', percent: 6.00)
  rules << PercentIncreaseByConditionRule.create(condition: 'High Cholesterol', percent: 8.00)

  rules.each do |rule|
    Rule.create(plan_id: plan.id, ruleable_id: rule.id, ruleable_type: rule.class.name)
  end
```

This would mean that for a user with both sleep apnea and high cholesterol would be given an estimate of $114.00. This calculation is done on the client side. The following is only a glimpse of the entire calculation:

```javascript
  // './frontend/util/render_price.jsx'

  export default (userInfo, rules) => {
    let basePrice = null
    let percentConditionIncrease = 0.0
    // ...

    for(const key in rules) {

      const rule = rules[key]

      switch (key) {
        case "base_price_rule":
          basePrice = rule.base_price
          break
        // ...
        case "percent_increase_by_condition_rules":
          const conditionRules = rule
          conditionRules.forEach(r => {
            if (userInfo.conditions[r.condition]) {
              percentConditionIncrease += r.percent
            }
          })
          break

        default:
          console.log("Unhandled rule: ", rule)
          break
      }
    }
    // ...

    let price, result
    if (basePrice) {
      price = basePrice
      price *= (1.0 + (percentConditionIncrease / 100))
      result = `${userInfo.name}'s policy is estimated at $${price.toFixed(2)}`
    } else {
      result = "Invalid plan"
    }

    return result
  }
  ```

It's possible that insurance companies won't want their pricing scheme available on the client side, in which case this logic can easily be placed in a PlanController action instead. This will require sending the user data, perhaps as a query string, to the backend. This would be the most ideal solution given that a plan could potentially be sending thousands of 'rules' to the client side.

While it is not useful in this application as it stands, specific rule associations are made via a 'Rule' model which itself makes a polymorphic association with specific rules.

```ruby
class Rule < ApplicationRecord
  belongs_to :plan
  belongs_to :ruleable, polymorphic: true
end

class Plan < ApplicationRecord
  has_many :rules

  has_one :base_price_ruling,
    -> { where ruleable_type: 'BasePriceRule' },
    class_name: 'Rule'

  has_one :base_price_rule,
    through: :base_price_ruling,
    source: :ruleable,
    source_type: 'BasePriceRule'
end
```

These validations can come in handy if you want to look at a specific rule or all rules for a plan.

#### Technologies used:
- Rails 5
- PostgreSQL
- React
- jQuery

Testing:
- Mocha
- Enzyme
- Chai
- JSDOM

## How to use
#### Initial Setup:

  1) install node dependencies:
  >\> npm install

  2) rename './config/database.yml.example' as 'database.yml'

  3) install gems:
  >\> bundle install

  4) setup database:
  >\> bundle exec rake db:setup

#### Run application:
  >\> npm run webpack

  >\> bundle exec rails s

  navigate to http://localhost:3000



#### Test application:
  frontend mocha/enzyme tests:
  >\> npm run test

  backend rspec tests:
  >\> bundle exec rake test
