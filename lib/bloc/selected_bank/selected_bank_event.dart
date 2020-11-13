part of 'selected_bank_bloc.dart';

@immutable
class SelectedBankEvent {
  final int id;
  final int index;

  SelectedBankEvent(this.id, this. index);
}

class SelectBank extends SelectedBankEvent{
  SelectBank(int id, int index) : super(id, index);
}