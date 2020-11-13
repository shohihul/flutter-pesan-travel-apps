part of 'dropoff_marker_bloc.dart';

@immutable
class DropoffMarkerEvent {
  final LatLng point;
  final String address;

  DropoffMarkerEvent(this.point, this.address);
}

class AddDropoffMarker extends DropoffMarkerEvent {
  AddDropoffMarker(LatLng point, String address) : super(point, address);
}