// app/javascript/controllers/map_controller.js
import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

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

    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,address"
    })
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
    this.geocoder.addTo(this.element)


    // this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl }))
  }

  #setInputValue(event) {
    console.log(event.result)
    // event.result["place_name"].replace(/^(.*?),(.*)$/, "$1");
    // const str = event.result["place_name"].replace(/^(.*?),(.*)$/, "$1");
    // this.addressTarget.value = event.result["place_name"].replace(/^(.*?),(.*)$/, "$1");

      new mapboxgl.Marker()
      .setLngLat([event.result.center[0], event.result.center[1]])
      .addTo(this.map)
      this.map.flyTo({
        center: [event.result.center[0], event.result.center[1]],
       // this animation is considered essential with respect to prefers-reduced-motion
        zoom: 10
      });
      lastloc = [event.result.center[0], event.result.center[1]]
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }

}
