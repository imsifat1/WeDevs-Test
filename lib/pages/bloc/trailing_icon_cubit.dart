import 'package:bloc/bloc.dart';

class TrailingIconCubit extends Cubit<bool> {
  TrailingIconCubit() : super(false);

  void toggleIcon() => emit(!state);
}
