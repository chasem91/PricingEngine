import React from 'react'
import { should, expect, assert } from 'chai'
import { shallow, mount, render } from 'enzyme'
import App from '../app'
import Price from '../price'
import UserInfoForm from '../user_info_form'

describe('App', () => {
  const wrapper = shallow(<App />)

  it('should render without errors', () => {
    const node = <div className="title">Insurance Pricing Engine</div>
    expect(wrapper.contains(node)).to.equal(true)
  })

  it('should render Price component', () => {
    expect(wrapper.find(Price).exists()).to.equal(true)
  })

  it('should render UserInfoForm component', () => {
    expect(wrapper.find(UserInfoForm).exists()).to.equal(true)
  })
})
