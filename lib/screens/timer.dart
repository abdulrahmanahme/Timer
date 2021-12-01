import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timer/Cubit/cubit.dart';
import 'package:timer/Cubit/states.dart';
import 'package:timer/Responsive/responsive.dart';
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

                                          // width: 800,
                                          child: Card(
                                            shape: const RoundedRectangleBorder(
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
                                                              const Text(
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
                                                              const Text(
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
                                                      StreamBuilder<int?>(
                                                          stream:
                                                              _stopWatchTimer
                                                                  .rawTime,
                                                          initialData: 2,
                                                          builder: (context,
                                                              snapshot) {
                                                            final value =
                                                                snapshot.data;
                                                            final displayTime =
                                                                StopWatchTimer
                                                                    .getDisplayTime(
                                                                        value!,
                                                                        hours:
                                                                            _isHours);
                                                            return Text(
                                                              displayTime,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 50,
                                                              ),
                                                            );
                                                          }),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Button(
                                                            name: 'Start',
                                                            color: Colors.green,
                                                            onPressed: () {
                                                              _stopWatchTimer
                                                                  .onExecute
                                                                  .add(StopWatchExecute
                                                                      .start);
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width: 13,
                                                          ),
                                                          Button(
                                                            name: 'Reset',
                                                            color: Colors.black,
                                                            onPressed: () {
                                                              _stopWatchTimer
                                                                  .onExecute
                                                                  .add(StopWatchExecute
                                                                      .reset);
                                                            },
                                                          ),
                                                          SizedBox(
                                                            width: 13,
                                                          ),
                                                          Button(
                                                            name: 'Stop',
                                                            color: Colors.red,
                                                            onPressed: () {
                                                              _stopWatchTimer
                                                                  .onExecute
                                                                  .add(StopWatchExecute
                                                                      .stop);
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
                                })
                            : Center(
                                child: Text(
                                  'NO Timer To Add',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    ButtonWidget(onClicked: () {
                      draggleSheet(context: context);
                    }),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
