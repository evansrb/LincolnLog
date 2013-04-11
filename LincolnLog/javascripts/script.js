function getLatLngFromName(name, callback) {

    var place = { "address": name };

    var result = false;

    geocoder.geocode(place, function (results, status) {

        if (status == google.maps.GeocoderStatus.OK) {

            result = results[0].geometry.location;

            callback(map, pin, result);

        }

    });

    return result;

}