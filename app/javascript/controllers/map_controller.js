// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#fitMapToMarkers()
    // this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl }))
  }

  #fitMapToMarkers() {
    this.map.fitBounds([
      [-79.686915, -12.144785], // southwestern corner of the bounds -12.144785, -63.686915
      [-38.160500, -7.984657] // northeastern corner of the bounds -7.984657, -35.160500
      ], { padding: 100, maxZoom: 20, duration: 3 });
  }

}
