function getLatLngFromName(name) {

    var geocoder = 

    geocoder.geocode({ 'address': "Springfield, IL" }, function (results, status) {

        if (status == google.maps.GeocoderStatus.OK) {

            alert('x');

            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });

        } else {

            alert("Geocode was not successful for the following reason: " + status);

        }

    });

}