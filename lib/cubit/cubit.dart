import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/Cubit/states.dart';
import 'package:timer/screens/timer.dart';
import 'package:timer/screens/watch.dart';

class TimerCubit extends Cubit<TimerStates> {
  TimerCubit() : super(InitialState());
  static TimerCubit get(context) => BlocProvider.of(context);
  int counter = 0;
  void onItemTapped(int index) {
    counter = index;
    emit(OnItemTapped());
  }

  List<Widget> widgetOpetion = [
    Timer(),
    Watch(),
  ];
}
