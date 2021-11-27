import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
            child: Text(
              'Hello',
              style: TextStyle(
                fontSize: 50,
                color: Colors.amber,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
