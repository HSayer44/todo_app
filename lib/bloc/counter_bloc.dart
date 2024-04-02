import 'package:bloc_tutorial/bloc/counter_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncremented>((event, emit) {
      emit(state + 1);
    });

    on<CounterDecremented>((event, emit) {
      emit(state - 1);
    });

    on<CounterRestarted>((event, emit) {
      emit(0);
    });
  }
}
