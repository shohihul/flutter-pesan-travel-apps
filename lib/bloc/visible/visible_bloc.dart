import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'visible_event.dart';
part 'visible_state.dart';

class VisibleBloc extends Bloc<VisibleEvent, VisibleState> {
  VisibleBloc() : super(VisibleState(true));

  @override
  Stream<VisibleState> mapEventToState(
    VisibleEvent event,
  ) async* {
    yield (event is VisibleFalse) ? VisibleState(false) : VisibleState(true);
  }
}
