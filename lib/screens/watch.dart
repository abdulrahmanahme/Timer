import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/Cubit/cubit.dart';
import 'package:timer/Cubit/states.dart';

class Watch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TimerCubit(),
      child: BlocConsumer<TimerCubit, TimerStates>(
          listener: (context, state) {},
          builder: (context, state) {
            TimerCubit cubit = TimerCubit.get(context);
            return Scaffold(
              body: Center(
                child: Text(
                  'Watch',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 50,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
