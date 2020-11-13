part of 'pickup_marker_bloc.dart';

@immutable
class PickupMarkerEvent {
  final LatLng point;
  final String address;

  PickupMarkerEvent(this.point, this.address);
}

class AddPickupMarker extends PickupMarkerEvent {
  AddPickupMarker(LatLng point, String address) : super(point, address);
}
