import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'pickup_marker_event.dart';
part 'pickup_marker_state.dart';

class PickupMarkerBloc extends Bloc<PickupMarkerEvent, PickupMarkerState> {
  PickupMarkerBloc() : super(PickupMarkerState(null, null));

  @override
  Stream<PickupMarkerState> mapEventToState(
    PickupMarkerEvent event,
  ) async* {
    yield (event is AddPickupMarker) ? PickupMarkerState(event.point, event.address) : PickupMarkerState(null, null);
  }
}
