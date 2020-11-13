part of 'pickup_marker_bloc.dart';

@immutable
class PickupMarkerState {
  final LatLng point;
  final String address;

  PickupMarkerState(this.point, this.address);
}