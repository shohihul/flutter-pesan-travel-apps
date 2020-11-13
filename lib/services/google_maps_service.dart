part of 'services.dart';

class GoogleMapsService {
  
  Future<String> getAddress(LatLng coordinate) async {
    var geocode = await placemarkFromCoordinates(coordinate.latitude, coordinate.longitude);
    var address = geocode.first.street + ', ' + geocode.first.subLocality + ', ' + geocode.first.locality + ', ' + geocode.first.subAdministrativeArea;
    return address;
  }
}