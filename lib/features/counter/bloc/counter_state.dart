part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class CounterActionState extends CounterState{}

class CounterIncrementState extends CounterState {
  final int val;

  CounterIncrementState({required this.val});
}

class CounterShowSnackbarActionState extends CounterActionState {}
