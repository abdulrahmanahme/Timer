import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timer/Cubit/cubit.dart';
import 'package:timer/Cubit/states.dart';
import 'package:timer/Responsive/responsive.dart';
import 'package:timer/screens/watch.dart';
import 'package:timer/widgets/widget.dart';

class Timer extends StatefulWidget {
  @override
  State<Timer> createState() => _TimerState();
}

final StopWatchTimer _stopWatchTimer = StopWatchTimer();
final _isHours = true;

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TimerCubit(),
      child: BlocConsumer<TimerCubit, TimerStates>(
          listener: (context, state) {},
          builder: (context, state) {
            TimerCubit cubit = TimerCubit.get(context);
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: displayHeight(context) * .70,
                        child: cubit.timerList.length > 0
                            ? ListView.builder(
                                itemCount: cubit.timerList.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: displayHeight(context) * .24,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              bottomLeft: Radius.circular(25),
                                              bottomRight: Radius.circular(25),
                                              topLeft: Radius.circular(25),
                                            )),
                                            elevation: 8,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Title :',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 15,
                                                              ),
                                                              Text(
                                                                cubit
                                                                    .timerList[
                                                                        index]
                                                                    .title!,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Des... :',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 20,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 15,
                                                              ),
                                                              Text(
                                                                cubit
                                                                    .timerList[
                                                                        index]
                                                                    .description,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 22,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      buildTimer()
                                                    ],
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                })
                            : Center(
                                child: Text(
                                  'Add a STOPWATCH ',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    ButtonWidget(onClicked: () {
                      draggleSheet(context: context);
                      titleController.clear();
                      descraptionController.clear();
                    }),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
