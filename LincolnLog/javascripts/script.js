var G_MAP;
var G_GEOCODER;

var CONFIG = {

    ZOOM_MIN : 0,
    ZOOM_MAX : 21,
    ZOOM_DEFAULT: 6,

    USER_ZOOM_MIN : 4,
    USER_ZOOM_MAX: 8,

    MAP_ID : "map-canvas"

};

var MAP_DEFAULT_OPTIONS = {
    zoom: CONFIG.ZOOM_DEFAULT,
    center: new google.maps.LatLng(0, 0),
    mapTypeId: google.maps.MapTypeId.ROADMAP
};

function bootstrap() {

    G_MAP = new google.maps.Map(document.getElementById(CONFIG.MAP_ID), MAP_DEFAULT_OPTIONS);
    G_GEOCODER = geocoder = new google.maps.Geocoder();

}

function enforceZoom(map, min, max, def) {

    google.maps.event.addListener(map, "zoom_changed", function () {

        var currentZoomLevel = map.getZoom();

        if (currentZoomLevel < min) {
            map.setZoom(def);
            return;
        }

        if (currentZoomLevel > max) {
            map.setZoom(def);
            return;
        }

    });

}

function getCenterPointFromMarkers(markers) {

    if (markers.length == 0) return new google.maps.LatLng(0, 0);

    var bounds = new google.maps.LatLngBounds();

    for (i = 0; i < markers.length; i++) {
        bounds.extend(markers[i].coords);
    }

    return bounds.getCenter();

}

function getLatLngFromName(name, callback) {

    var place = { "address" : name };

    var result = false;

    G_GEOCODER.geocode(place, function (results, status) {

        if (status == google.maps.GeocoderStatus.OK) {

            result = results[0].geometry.location;

            callback(map, pin, result);

        }

    });

    return result;

}