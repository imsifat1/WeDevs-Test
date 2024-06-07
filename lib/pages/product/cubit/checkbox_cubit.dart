import 'package:bloc/bloc.dart';

class CheckboxCubit extends Cubit<List<bool>> {
  CheckboxCubit(int itemCount) : super(List<bool>.filled(itemCount, false));
  void toggleCheckbox(int index) {
    final newState = List<bool>.from(state);
    newState[index] = !newState[index];
    emit(newState);
  }
}