import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="mapconteiner"
export default class extends Controller {
  static targets = ["map"]

  connect() {

  }

  storeValue() {
    const mapController = this.application.controllers.find(
      controller => controller.context.element.dataset.controller === "map"
      )
    mapController.storeValue()
    // if (mapController) {
    //   mapController.storeValue()
    // } else {
    //   console.error("Could not find map controller.")
    // }
  }



}
