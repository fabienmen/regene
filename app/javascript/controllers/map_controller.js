// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  static targets = ["address"]

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })


    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,address"
    })
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
    this.geocoder.addTo(this.element)
    console.log(this.element)

    // this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl }))
  }

  #setInputValue(event) {
    this.location =  event.result.place_name
    this.addressTarget.value = this.location
      new mapboxgl.Marker()
      .setLngLat([event.result.center[0], event.result.center[1]])
      .addTo(this.map)
      this.map.flyTo({
        center: [event.result.center[0], event.result.center[1]],
       // this animation is considered essential with respect to prefers-reduced-motion
        zoom: 10
      });
      // lastloc = [event.result.center[0], event.result.center[1]]
      console.log(event.result.center[0])
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }

  storeValue() {
    console.log(this.addressTarget.value)
    location = this.addressTarget.value
    fetch("/store_demo_value", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        demoValue: location
      })
    })
    // .then(response => {
    //   // Lógica a ser executada após a resposta da requisição
    // })
    // .catch(error => {
    //   // Lógica de tratamento de erros
    // });
  }
}
