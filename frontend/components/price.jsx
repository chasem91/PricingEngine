import React from 'react'
import renderPrice from '../util/render_price'

export default class Price extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    const userInfo = this.props.userInfo
    const plan = this.props.plan
    return (
      <div className="price-container">
        {renderPrice(userInfo, plan.rules)}
      </div>
    )
  }
}
