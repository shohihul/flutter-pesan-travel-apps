part of 'dropoff_marker_bloc.dart';

@immutable
class DropoffMarkerState {
  final LatLng point;
  final String address;

  DropoffMarkerState(this.point, this.address);
}
