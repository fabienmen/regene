import { Controller } from "@hotwired/stimulus"
import { preventOverflow } from "@popperjs/core"

// Connects to data-controller="replanted-size"
export default class extends Controller {
  static values = {
    mode: String,
    offer: Number
  }

  static targets = ["reais", "hectare", "range", "total", "form"]
  connect() {
    console.log(this.modeValue)
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

    if (this.modeValue) {
      fetch(`/offers/${this.offerValue}/edit_store_replanted`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          replanted: replanted
        })
      }).then(() => window.location = this.formTarget.action);
    } else {
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
}
