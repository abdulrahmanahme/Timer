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
                title: Center(
                  child: Text(
                    cubit.titleTimer[cubit.currentIndex],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              body: cubit.widgetOpetion[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.black,
                selectedLabelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.timer), label: 'Timer'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.watch_later),
                    label: 'Watch',
                  ),
                ],
                currentIndex: TimerCubit.get(context).currentIndex,
                onTap: (int index) {
                  TimerCubit.get(context).onItemTapped(index);
                },
              ),
            );
          }),
    );
  }
}
