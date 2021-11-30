import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timer/Cubit/cubit.dart';

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

Widget timer() {
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
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'd',
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
                          _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                        },
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Button(
                        name: 'Reset',
                        color: Colors.black,
                        onPressed: () {
                          _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                        },
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Button(
                        name: 'Stop',
                        color: Colors.red,
                        onPressed: () {
                          _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
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

late AnimationController controller;

String get countText {
  Duration count = controller.duration! * controller.value;
  return controller.isDismissed
      ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
      : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
}

var controllerAdd = TextEditingController();
var controllerTitle = TextEditingController();

void draggleSheet({BuildContext? context, Widget? widget}) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context!,
      builder: (context) => SingleChildScrollView(
            reverse: true,
            child: Container(
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(children: [
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        TextButton(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        Spacer(),
                        Text(
                          'Add time',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        TextButton(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: nametextForm(
                      name: 'Title',
                    ),
                  ),
                  defaultFormField(
                    controller: controllerAdd,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    type: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: nametextForm(
                      name: 'Descraption',
                    ),
                  ),
                  defaultFormField(
                    controller: controllerTitle,
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    type: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 180,
                    child: widget,
                  ),
                ])),
          ));
}

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CircleAvatar(
        radius: 30,
        child: Icon(
          icon,
          size: 36,
        ),
      ),
    );
  }
}

Widget defaultFormField({
  required TextEditingController? controller,
  required TextInputType? type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  bool isPassword = false,
  required FormFieldValidator<String>? validate,
  String? label,
  IconData? prefix,
  TextStyle? style,
  IconData? suffix,
  Function? suffixpress,
  Widget? suffixIcon,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      style: style,
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.black,
        focusColor: Colors.black,
        prefixIcon: Icon(
          prefix,
          color: Colors.black,
        ),
        suffixIcon: suffixIcon,
      ),
    );

class nametextForm extends StatelessWidget {
  String? name;
  nametextForm({
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name!,
          style: TextStyle(
              // color: Color(0xff1A2552),
              fontSize: 18,
              color: Colors.grey[600],
              fontWeight: FontWeight.w700,
              fontFamily: 'jannah'),
        ),
      ],
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0XFF4C68DA),
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 90, right: 90),
          minimumSize: Size(100, 42),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 8),
            Text(
              'Add Timer',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        onPressed: onClicked,
      );
}
