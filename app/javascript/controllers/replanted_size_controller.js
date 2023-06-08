import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="replanted-size"
export default class extends Controller {
  static targets = ["money", "demo", "range", "total"]
  connect() {
    this.demoTarget.innerHTML = this.rangeTarget.value
    this.moneyTarget.innerHTML = this.demoTarget.innerHTML * this.totalTarget.innerHTML
  }

  displaySize(event) {
    this.demoTarget.innerHTML = this.rangeTarget.value
    this.moneyTarget.innerHTML = this.demoTarget.innerHTML * this.totalTarget.innerHTML
    console.log("ola ola ola")
    // fetch('/store_demo_value', {
    //   method: 'POST',
    //   body: JSON.stringify({ demoValue: this.demoTarget.innerHTML }),
    //   headers: {
    //     'Content-Type': 'application/json'
    //   }
    // })
  }

  // storeValue() {
  //   console.log("ola")
  //   sessionStorage.setItem("demoValue", this.demoTarget.innerHTML)
  // }
}
