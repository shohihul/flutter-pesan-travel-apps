import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selected_bank_event.dart';
part 'selected_bank_state.dart';

class SelectedBankBloc extends Bloc<SelectedBankEvent, SelectedBankState> {
  SelectedBankBloc() : super(SelectedBankState(null, null));

  @override
  Stream<SelectedBankState> mapEventToState(
    SelectedBankEvent event,
  ) async* {
    if (event is SelectBank) {
      yield SelectedBankState(event.id, event.index);
    }
  }
}
