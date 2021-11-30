import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timer/Cubit/states.dart';
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

  List<String> title = [
    'Timer',
    'Add Time',
  ];
  List<Widget> timerList = [
    timer(),
  ];

  void Function()? add(Widget widget) {
    timerList.add(widget);
    emit(AddTimerStetes());
  }

  void Function()? addTimer() {
    timerList.add(timer());
    emit(AddTimerStetes());
  }

  List<Widget> widgetOpetion = [
    Timer(),
    // TimerPickerPage(),
    CountdownPage(),
    // TimePickerWidget(),
  ];
  var controller = TextEditingController();

  Widget timer2() {
    final StopWatchTimer _stopWatchTimer = StopWatchTimer();
    final _isHours = true;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
                topLeft: Radius.circular(25),
              )),
              elevation: 8,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   'd',
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.red,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Text(
                      controller.text,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    StreamBuilder<int?>(
                        stream: _stopWatchTimer.rawTime,
                        initialData: 2,
                        builder: (context, snapshot) {
                          final value = snapshot.data;
                          final displayTime = StopWatchTimer.getDisplayTime(
                              value!,
                              hours: _isHours);
                          return Text(
                            displayTime,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 50,
                            ),
                          );
                        }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Button(
                          name: 'Start',
                          color: Colors.green,
                          onPressed: () {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.start);
//
                          },
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Button(
                          name: 'Reset',
                          color: Colors.black,
                          onPressed: () {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.reset);
                          },
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Button(
                          name: 'Stop',
                          color: Colors.red,
                          onPressed: () {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.stop);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          ),
        )
      ],
    );
  }
}
