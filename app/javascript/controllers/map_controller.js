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
            'fill-color': this.selectcolor(biome.properties.Name), // color fill

            'fill-opacity': 0.3
          }
        });

        this.map.on('click', biome.properties.Name, (e) => {
          new mapboxgl.Popup()
          .setLngLat(e.lngLat)
          .setHTML('<strong>'+biome.properties.Name+'<strong>')
          .addTo(this.map);
          });

          // Change the cursor to a pointer when
          // the mouse is over the states layer.
          this.map.on('mouseenter', biome.properties.Name, () => {
          this.map.getCanvas().style.cursor = 'pointer';
          });

          // Change the cursor back to a pointer
          // when it leaves the states layer.
          this.map.on('mouseleave', biome.properties.Name, () => {
          this.map.getCanvas().style.cursor = '';
          });

      });
    });
  }

  selectcolor(name) {
    switch (name) {
      case 'Caatinga':
        return "#2196F3";
      case 'Cerrado':
        return "#333333";
      case 'Pantanal':
        return "#FF8080";
      case 'Pampa':
        return "#FFFFFF";
      case 'Amazônia':
        return "#22AA64";
      case 'Mata Atlântica':
        return "#29CF7A";
    }
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
        new mapboxgl.Marker({

            draggable: true

        })
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
