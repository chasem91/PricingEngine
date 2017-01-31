import React from 'react'
import Price from './price'
import UserInfoForm from './user_info_form'
import $ from 'jquery'

export default class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      companies: [],
      selectedCompany: { plans: [] },
      selectedPlan: {},
      userInfo: {
        name: '[NAME]',
        age: 0,
        gender: 'Male',
        location: 'New York',
        conditions: {
          'Allergies': false,
          'Heart Disease': false,
          'High Cholesterol': false,
          'Sleep Apnea': false,
          'Asthma': false
        }
      }
    }

    this.setName =  this.setName.bind(this)
    this.setAge = this.setAge.bind(this)
    this.setGender = this.setGender.bind(this)
    this.setLocation = this.setLocation.bind(this)
    this.setCondition = this.setCondition.bind(this)
  }

  componentWillMount() {
    $.ajax({
      method: 'GET',
      url: '/api/companies',
      success: companies => {
        this.setState({
          companies,
          selectedCompany: companies[0],
          selectedPlan: companies[0].plans[0]
        })
      },
      error: () => console.log('error fetching companies')
    })
  }

  setName(e) {
    const userInfo = this.state.userInfo
    const newName = e.target.value
    userInfo.name = (newName === '') ? '[NAME]' : newName
    this.setState({ userInfo })
  }

  setAge(e) {
    const userInfo = this.state.userInfo
    userInfo.age = e.target.value
    this.setState({ userInfo })
  }

  setGender(e) {
    const userInfo = this.state.userInfo
    userInfo.gender = e.target.value
    this.setState({ userInfo })
  }

  setLocation(e) {
    const userInfo = this.state.userInfo
    userInfo.location = e.target.value
    this.setState({ userInfo })
  }

  setCondition(e) {
    const userInfo = this.state.userInfo
    userInfo.conditions[e.target.name] = (e.target.checked) ? true : false
    this.setState({ userInfo })
  }

  render() {
    const s = this.state
    console.log(s)
    return (
      <div className="app-container">
        <div className="title">Insurance Pricing Engine</div>

        <UserInfoForm
          setName={this.setName}
          setAge={this.setAge}
          setGender={this.setGender}
          setLocation={this.setLocation}
          setCondition={this.setCondition}/>

        {planSelection(s)}

        <Price userInfo={s.userInfo} plan={s.selectedPlan}/>
      </div>
    )
  }
}

const planSelection = s => (
  <div className="plan-select">
    {companyOptions(s.companies)}
    {planOptions(s.selectedCompany.plans)}
  </div>
)

const planOptions = plans => (
  <select>
    {plans.map((p, idx) => <option key={idx}>{p.name}</option>)}
  </select>
)

const companyOptions = companies => (
  <select>
    {companies.map((c, idx) => <option key={idx}>{c.name}</option>)}
  </select>
)
