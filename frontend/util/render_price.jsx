export default (userInfo, rules) => {
  let validAge = true
  let basePrice = null
  let fixedAgeIncrease = 0
  let percentConditionIncrease = 0.0
  let percentRegionDiscount = 0.0
  let fixedGenderDiscount = 0

  for(const key in rules) {

    const rule = rules[key]

    switch (key) {
      case "base_price_rule":
        basePrice = rule.base_price
        break

      case "min_age_rule":
        validAge = (rule.minimum_age <= userInfo.age) ? true : false
        break

      case "fixed_discount_by_gender_rule":
        fixedGenderDiscount = (rule.gender === userInfo.gender)
        ? rule.discount
        : fixedGenderDiscount
        break

      case "fixed_increase_by_age_rule":
        const ageDiff = parseInt(userInfo.age) - rule.base_age
        fixedAgeIncrease = (ageDiff > 0)
        ? (rule.amount * Math.floor(ageDiff / rule.age_interval))
        : fixedAgeIncrease
        break

      case "percent_discount_by_region_rule":
        percentRegionDiscount = (regions[rule.region][userInfo.location])
        ? rule.percent
        : percentRegionDiscount
        break

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

  let price, result
  if (basePrice && validAge) {
    price = basePrice
    price += fixedAgeIncrease
    price *= (1.0 - (percentRegionDiscount / 100))
    price *= (1.0 + (percentConditionIncrease / 100))
    price -= fixedGenderDiscount
    result = `${userInfo.name}'s policy is estimated at $${price.toFixed(2)}`
  } else if (basePrice && !validAge) {
    result = `${userInfo.name} is not eligible for a life insurance policy`
  } else {
    result = "Invalid plan"
  }

  return result
}

const regions = {
  'East Coast of America': {
    'Boston': true,
    'New York': true,
    'Washington D.C.': true
  }
}
