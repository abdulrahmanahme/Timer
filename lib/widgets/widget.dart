import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Button extends StatefulWidget {
  String? name;
  Color? color;
  void Function()? onPressed;
  Button({this.name, this.color, this.onPressed});
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<Button> {
  bool pressAttention = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: widget.color,
          padding: EdgeInsets.only(top: 10, bottom: 8, left: 25, right: 25),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        child: Text(
          widget.name!,
          style: TextStyle(
            fontSize: 19,
            // height: 4,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: widget.onPressed);
  }
}

class Timer_Widget extends StatefulWidget {
  @override
  State<Timer_Widget> createState() => _Timer_WidgetState();
}

class _Timer_WidgetState extends State<Timer_Widget> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    StreamBuilder<int?>(
                        stream: _stopWatchTimer.rawTime,
                        initialData: 0,
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
