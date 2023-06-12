import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  background() {
    this.element.classList.toggle("new-background")
  }
}
