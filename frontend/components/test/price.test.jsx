import React from 'react'
import { expect } from 'chai'
import { shallow, mount, render } from 'enzyme'
import App from '../app'
import Price from '../price'
import UserInfoForm from '../user_info_form'

describe('Price', () => {
  const selectedPlan = {
    name: 'Standard Taco Plan',
    rules: {
      min_age_rule:                     { minimum_age: 18 },
      base_price_rule:                  { base_price: 100 },
      fixed_discount_by_gender_rule:    { discount: 12, gender: "Female" },
      fixed_increase_by_age_rule:       { age_interval: 5, amount: 20, base_age: 18 },
      percent_discount_by_region_rule:  { percent: 5, region: "East Coast of America" },
      percent_increase_by_condition_rules: [
        { condition: "Allergies", percent: 1 },
        { condition: "Sleep Apnea", percent: 6 },
        { condition: "Heart Disease", percent: 17 },
        { condition: "High Cholesterol", percent: 8 },
        { condition: "Asthma", percent: 4 },
      ]
    }
  }

  it('should render without errors', () => {
    const appWrapper = shallow(<App />)
    const priceWrapper = appWrapper.find(Price).first()

    expect(priceWrapper.exists()).to.equal(true)
  })

  const appWrapper = mount(<App />)
  appWrapper.setState({ selectedPlan })
  const priceWrapper = appWrapper.find(Price).first()

  it('should display price correctly case 1', () => {
    appWrapper.setState({ userInfo: {
        name: 'Kelly',
         age: 50,
          gender: 'Female',
          location: 'Boston',
          conditions: { 'Allergies': true }
        } })
    const priceDisplay = "Kelly's policy is estimated at $199.09"

    expect(priceWrapper.text()).to.equal(priceDisplay)
  })

  it('should display price correctly case 2', () => {
    appWrapper.setState({ userInfo: {
        name: 'Josh',
        age: 40,
        gender: 'Male',
        location: 'Seattle',
        conditions: { 'Sleep Apnea': true }
      } })
    const priceDisplay = "Josh's policy is estimated at $190.80"

    expect(priceWrapper.text()).to.equal(priceDisplay)
  })

  it('should display price correctly case 3', () => {
    appWrapper.setState({ userInfo: {
        name: 'Jan',
        age: 30,
        gender: 'Female',
        location: 'New York',
        conditions: { 'Heart Disease': true, 'High Cholesterol': true }
      } })
    const priceDisplay = "Jan's policy is estimated at $154.25"

    expect(priceWrapper.text()).to.equal(priceDisplay)
  })

  it('should display price correctly case 4', () => {
    appWrapper.setState({ userInfo: {
        name: 'Brad',
        age: 20,
        gender: 'Male',
        location: 'San Francisco',
        conditions: { }
      } })
    const priceDisplay = "Brad's policy is estimated at $100.00"

    expect(priceWrapper.text()).to.equal(priceDisplay)
  })

  it('should alert ineligibility for underage applicants', () => {
    appWrapper.setState({ userInfo: {
        name: 'Petr',
        age: 10,
        gender: 'Male',
        location: 'Los Angeles',
        conditions: { 'Asthma': true }
      } })
    const priceDisplay = "Petr is not eligible for a life insurance policy"

    expect(priceWrapper.text()).to.equal(priceDisplay)
  })

  it('should alert invalid plan for missing base_price_rule', () => {
    const newPlan = selectedPlan
    delete newPlan.rules['base_price_rule']
    appWrapper.setState({ selectedPlan: newPlan, userInfo: {
        name: 'Brad',
        age: 20,
        gender: 'Male',
        location: 'San Francisco',
        conditions: { }
      } })
    const priceDisplay = "Invalid plan"

    expect(priceWrapper.text()).to.equal(priceDisplay)
  })
})
