import 'dart:developer';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (bloc is Cubit) {
      log("This is a Cubit");
    } else {
      log("This is a Bloc");
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log("an event Happened in $bloc the event is $event");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log("There was a transition from ${transition.currentState} to ${transition.nextState}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log("Error happened in $bloc with error $error and the stacktrace is $stackTrace");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log("BLOC is closed");
  }
}