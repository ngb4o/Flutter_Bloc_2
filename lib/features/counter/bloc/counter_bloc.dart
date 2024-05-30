import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>(counterIncrementEvent);
    on<CounterShowSnackbarEvent>(counterShowSnackbarEvent);
  }

  int value = 0;

  FutureOr<void> counterIncrementEvent(
      CounterIncrementEvent event, Emitter<CounterState> emit) {
    value++;
    emit(CounterIncrementState(val: value));
  }

  FutureOr<void> counterShowSnackbarEvent(
      CounterShowSnackbarEvent event, Emitter<CounterState> emit) {
    emit(CounterShowSnackbarActionState());
  }
}
