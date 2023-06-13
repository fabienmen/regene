import { Controller } from "@hotwired/stimulus"
import { preventOverflow } from "@popperjs/core"

// Connects to data-controller="replanted-size"
export default class extends Controller {
  static targets = ["reais", "hectare", "range", "total", "form"]
  connect() {
    this.hectareTarget.innerHTML = this.rangeTarget.value
    this.reaisTarget.innerHTML = this.hectareTarget.innerHTML * this.totalTarget.innerHTML
  }

  displaySize() {
    this.hectareTarget.innerHTML = this.rangeTarget.value
    this.reaisTarget.innerHTML = this.hectareTarget.innerHTML * this.totalTarget.innerHTML
  }

  storeValue(event) {
    event.preventDefault()

    let replanted = this.hectareTarget.innerHTML
    fetch("/store_replanted", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        replanted: replanted
      })
  }).then(() => window.location = this.formTarget.action);
  }
}
