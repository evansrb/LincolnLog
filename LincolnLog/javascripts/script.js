﻿var G_MAP; // the google map object
var G_GEOCODER; // the google geocoder object

// this holds configuration data
var LL_CONFIG = {

    ZOOM_MIN : 0,
    ZOOM_MAX : 21,
    ZOOM_DEFAULT: 5,

    USER_ZOOM_MIN : 4,
    USER_ZOOM_MAX: 8,

    MAP_ID : "map-canvas"

};

// map default options
var MAP_DEFAULT_OPTIONS = {
    zoom: LL_CONFIG.ZOOM_DEFAULT,
    center: new google.maps.LatLng(0, 0),
    mapTypeControlOptions: {
        mapTypeIds: [google.maps.MapTypeId.TERRAIN]
    },
    mapTypeId: google.maps.MapTypeId.TERRAIN,
    streetViewControl: false
};

function bootstrap() {

    G_MAP = new google.maps.Map(document.getElementById(LL_CONFIG.MAP_ID), MAP_DEFAULT_OPTIONS);
    G_GEOCODER = geocoder = new google.maps.Geocoder();

}

function sizeMap() {

    var newHeight = $(window).height() - ($("#" + LL_CONFIG.MAP_ID).offset().top + 50);

    $("#" + LL_CONFIG.MAP_ID).height(newHeight);

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

function getLatLngFromName(name, callback, map, pin) {

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

function centerMapAtPoint(point) {

    G_MAP.setCenter(point);

}

function update(map, pin, loc) {

    map.setCenter(loc);
    pin.setPosition(loc);

}