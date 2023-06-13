// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import { end } from "@popperjs/core"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    editMode: String,
    latitude: Number,
    longitude: Number,
    offer: Number
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      projection: 'globe',
      style: "mapbox://styles/mapbox/satellite-streets-v12",
      center: this.mapCenter(),
      zoom: this.mapzoom()
    })

    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,address"
    })

    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
    this.geocoder.addTo(this.element)
  }

  mapzoom() {
    const zoom = 2;
    return this.editModeValue ? 5 : zoom;
  }

  mapCenter() {
    const defaultCenter = [ -53.198048418153014, -8.240508731394382];
    return this.editModeValue ? [ this.longitudeValue, this.latitudeValue ] : defaultCenter;
  }

  #setInputValue(event) {
    if (this.editModeValue) {
      let location =  event.result.text
      let latitude = event.result.geometry.coordinates[0]
      let longitude = event.result.geometry.coordinates[1]
      fetch(`/offers/${this.offerValue}/store_edit_value`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        location: location,
        latitude: latitude,
        longitude: longitude
      })
      });

    } else {
      let location =  event.result.text
      let latitude = event.result.geometry.coordinates[0]
      let longitude = event.result.geometry.coordinates[1]
      fetch("/store_demo_value", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        location: location,
        latitude: latitude,
        longitude: longitude
      })
      });
    }
        new mapboxgl.Marker()
        .setLngLat([event.result.center[0], event.result.center[1]])
        .addTo(this.map)
        this.map.flyTo({
          center: [event.result.center[0], event.result.center[1]],
        // this animation is considered essential with respect to prefers-reduced-motion
          zoom: 10
        });

  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }
}
