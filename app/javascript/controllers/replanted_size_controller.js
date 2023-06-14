import { Controller } from "@hotwired/stimulus"
import { preventOverflow } from "@popperjs/core"

// Connects to data-controller="replanted-size"
export default class extends Controller {
  static values = {
    mode: String,
    offer: Number,
    total: Number
  }

  static targets = ["reais", "hectare", "range", "form"]

  connect() {
    this.hectareTarget.innerHTML = this.rangeTarget.value
    this.reaisTarget.innerHTML = (this.hectareTarget.innerHTML * this.totalValue).toLocaleString("pt-BR")
  }

  displaySize() {
    this.hectareTarget.innerHTML = this.rangeTarget.value
    this.reaisTarget.innerHTML = this.hectareTarget.innerHTML * this.totalValue
  }

  storeValue(event) {
    event.preventDefault()
    let replanted = this.hectareTarget.innerHTML
    let url
    if(this.modeValue === "true") {
      url = `/offers/${this.offerValue}/edit_store_replanted`
    } else {
      url = "/store_replanted"
    }
    fetch(url, {
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
