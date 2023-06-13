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
      projection: 'globe',
      style: "mapbox://styles/mapbox/satellite-streets-v12",
      center: [-53.198048418153014, -8.240508731394382],
      zoom: 2
    })

    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address",
    })

    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.addTo(this.element)

    //new
    fetch('brazil.json')
      .then(response => response.json())
      .then(data => this.layersonmap(data));


  }

  // biome
  layersonmap(biomes) {
    biomes.features.forEach(biome => {
      console.log(biome);

      console.log(biome.geometry.type);

      console.log(biome.properties.Name);

      console.log(biome.geometry.coordinates);

      this.map.on('load', () => {
        // Add a data source containing GeoJSON data.
        this.map.addSource(biome.properties.Name, {
          'type': 'geojson',
          'data': {
            'type': 'Feature',
            'geometry': {
              'type': biome.geometry.type,
              // These coordinates outline Maine.
              'coordinates':
                biome.geometry.coordinates
            }
          }
        });

        // Add a new layer to visualize the polygon.
        this.map.addLayer({
          'id': biome.properties.Name,
          'type': 'fill',
          'source': biome.properties.Name, // reference the data source
          'layout': {},
          'paint': {
            'fill-color': this.selectcolor(biome.properties.Name), // blue color fill

            'fill-opacity': 0.5
          }
        });
        // Add a black outline around the polygon.
        this.map.addLayer({
          'id': 'outline' + biome.properties.Name,
          'type': 'line',
          'source': biome.properties.Name,
          'layout': {},
          'paint': {
            'line-color': '#000',
            'line-width': 1
          }
        });
      });
    });
  }
  //biome

  selectcolor(name) {
    switch (name) {
      case 'Caatinga':
        return "#ffffff";
      case 'Cerrado':
        return "#66cc00";
      case 'Pantanal':
        return "#a300cc";
      case 'Pampa':
        return "#0052cc";
      case 'Amazônia':
        return "#cc0000";
      case 'Mata Atlântica':
        return "#2929a3";
    }
  }












  #setInputValue(event) {
    let location = event.result.text
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

    new mapboxgl.Marker()
      .setLngLat([event.result.center[0], event.result.center[1]])
      .addTo(this.map)
    this.map.flyTo({
      center: [event.result.center[0], event.result.center[1]],
      // this animation is considered essential with respect to prefers-reduced-motion
      zoom: 8,
    });
  }
}
