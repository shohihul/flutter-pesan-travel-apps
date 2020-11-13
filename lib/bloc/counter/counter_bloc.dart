import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(1));

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    yield (event is Increment) ? CounterState(state.value + 1)
      : (event is Decrement) ? CounterState(state.value - 1)
      : CounterState(1);
  }
}
