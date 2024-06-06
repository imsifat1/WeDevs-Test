import 'package:bloc/bloc.dart';


class ToggleVisibilityCubit extends Cubit<bool> {
  ToggleVisibilityCubit() : super(true);

  void toggle() => emit(!state);
}
