import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timer/Cubit/states.dart';
import 'package:timer/model/model.dart';
import 'package:timer/screens/timer.dart';
import 'package:timer/screens/watch.dart';
import 'package:timer/widgets/widget.dart';

class TimerCubit extends Cubit<TimerStates> {
  TimerCubit() : super(InitialState());
  static TimerCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int currentPage = 0;
  void onItemTapped(int index) {
    currentIndex = index;
    emit(OnItemTappedStetes());
  }

  List<String> titleTimer = [
    'Timer',
    'Add Time',
  ];
  List<Todo> timerList = [];

  void Function()? addTimer({String? title, String? description}) {
    final todo = Todo(
      title: title,
      description: description!,
    );
    timerList.add(todo);
    emit(AddTimerStetes());
  }

  List<Widget> widgetOpetion = [
    Timer(),
    AddTimer(),
  ];
}
