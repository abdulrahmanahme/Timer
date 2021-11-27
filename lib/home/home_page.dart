import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/Cubit/cubit.dart';
import 'package:timer/Cubit/states.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TimerCubit(),
      child: BlocConsumer<TimerCubit, TimerStates>(
          listener: (context, state) {},
          builder: (context, state) {
            TimerCubit cubit = TimerCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white24,
                elevation: 0,
                title: const Center(
                  child: Text(
                    'Timer',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                        fontFamily: 'jannah'),
                  ),
                ),
              ),
              body: cubit.widgetOpetion[cubit.counter],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.timer), label: 'Timer'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.watch_later), label: 'Watch'),
                ],
                currentIndex: TimerCubit.get(context).counter,
                onTap: (int index) {
                  TimerCubit.get(context).onItemTapped(index);
                },
              ),
            );
          }),
    );
  }
}
