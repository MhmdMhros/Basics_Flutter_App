import 'package:bloc/bloc.dart';
import 'package:myapp/modules/basics/counter/cubit/states.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitialState());
  static CounterCubit get(context) => BlocProvider.of(context);
  int counter = 0;
  void Minus()
  {
    counter--;
    emit(CounterMinusState(counter));
  }
  void Plus()
  {
    counter++;
    emit(CounterPlusState(counter));
  }
}