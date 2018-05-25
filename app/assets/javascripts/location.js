var latitude = 38.886882;
var longitude = -77.094650;
var radius = 100;
var localList = [];
var cap1Location = ["Capital One Labs", "3030 Clarendon Blvd, Arlington, VA 22201"];
localList.push(cap1Location);

      var map;
      var infowindow;

      function initMap() {
        var cap1 = {lat: latitude, lng: longitude};

        map = new google.maps.Map(document.getElementById('map'), {
          center: cap1,
          zoom: 15
        });

        infowindow = new google.maps.InfoWindow();
        var service = new google.maps.places.PlacesService(map);
        service.nearbySearch({
          location: cap1,
          radius: radius,
          type: ['store']
        }, callback);
      }

      function callback(results, status) {
        if (status === google.maps.places.PlacesServiceStatus.OK) {
          for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
            if(results[i].name != "Dodson Bros Exterminating Co"){
                var curLocation = [results[i].name, results[i].vicinity];
                localList.push(curLocation);
            }
          }
        }
      }

      function createMarker(place) {
        var placeLoc = place.geometry.location;
        var marker = new google.maps.Marker({
          map: map,
          position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.setContent(place.name);
          infowindow.open(map, this);
        });
      }

      var lastUpdated = 0;
      function updateLocation() {
          if(lastUpdated == localList.length - 1){
              lastUpdated = 0;
          } else {
                lastUpdated++;
          }
          var newLocation = localList[lastUpdated][0] + ", " + localList[lastUpdated][1];
        $('#change-location').text(newLocation);
      }

