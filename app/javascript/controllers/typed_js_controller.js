import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["ganhe mais", "ajude a sua familia", "lucre mais", "fica de boa"],
      typeSpeed: 50,
      loop: true
    })
  }
}
