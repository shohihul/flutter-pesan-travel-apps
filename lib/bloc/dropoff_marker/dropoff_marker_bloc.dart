import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'dropoff_marker_event.dart';
part 'dropoff_marker_state.dart';

class DropoffMarkerBloc extends Bloc<DropoffMarkerEvent, DropoffMarkerState> {
  DropoffMarkerBloc() : super(DropoffMarkerState(null, null));

  @override
  Stream<DropoffMarkerState> mapEventToState(
    DropoffMarkerEvent event,
  ) async* {
    yield (event is AddDropoffMarker) ? DropoffMarkerState(event.point, event.address) : DropoffMarkerState(null, null);
  }
}
