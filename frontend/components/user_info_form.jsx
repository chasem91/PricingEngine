import React from 'react'

export default class UserInfoForm extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    const { setName, setAge, setGender, setLocation, setCondition } = this.props
    return (
      <div>
        <div className="user-info-form">
          <input onChange={setName} placeholder="First name"/>
          <label>Age: {ageOptions(setAge)} </label>
          <label>Gender: {genderOptions(setGender)} </label>
          <label>Location: {locationOptions(setLocation)} </label>
          <label>Preexisiting conditions: {conditionOptions(setCondition)} </label>
        </div>
      </div>
    )
  }
}

const genderOptions = setGender => (
  <select onChange={setGender}>
    <option>Male</option>
    <option>Female</option>
  </select>
)

const ageOptions = setAge => {
  const options = []

  let i = 0
  while (i < 100) {
    options.push(<option key={i}>{i}</option>)
    i += 1
  }
  return (
    <select onChange={setAge}>
      {options}
    </select>
  )
}

const locationOptions = setLocation => {
  const cities = [
    "New York", "Los Angeles", "Chicago", "San Francisco", "Seattle",
    "Portland", "Boston", "Austin", "Nashville", "Washington D.C."
  ]
  return (
    <select onChange={setLocation}>
      {cities.map((c, idx) => <option key={idx}>{c}</option>)}
    </select>
  )
}

const conditionOptions = setCondition => (
  <form onChange={setCondition} className="condition-checkboxes">
    <label><input type="checkbox" name="Allergies"        /> Allergies        </label>
    <label><input type="checkbox" name="Asthma"           /> Asthma           </label>
    <label><input type="checkbox" name="Heart Disease"    /> Heart Disease    </label>
    <label><input type="checkbox" name="High Cholesterol" /> High Cholesterol </label>
    <label><input type="checkbox" name="Sleep Apnea"      /> Sleep Apnea      </label>
  </form>
)
