import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timer/Cubit/cubit.dart';
import 'package:timer/Cubit/states.dart';
import 'package:timer/widgets/widget.dart';

class Timer extends StatefulWidget {
  @override
  State<Timer> createState() => _TimerState();
}

var ODOcontroller = TextEditingController();

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
                        height: 500,
                        width: 500,
                        child: ListView.builder(
                            itemCount: cubit.timerList.length,
                            itemBuilder: (context, index) {
                              return cubit.timerList[index];
                            }),
                      ),
                    ),

                    ButtonWidget(onClicked: () {
                      cubit.addTimer();
                    }),

                    // Button(
                    //   color: Colors.black,
                    //   name: 'test',
                    //   onPressed: () {
                    //     cubit.addTimer();
                    //     showMaterialDialog(context);
                    //   },
                    // )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
