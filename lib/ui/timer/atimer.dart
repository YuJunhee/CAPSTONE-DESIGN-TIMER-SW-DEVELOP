import 'dart:async';

import 'package:flutter/material.dart';

//누적식 타이머(스톱워치) 구현
class Atimer extends StatefulWidget {
  @override
  AtimerState createState() => AtimerState();
}

class AtimerState extends State<Atimer> {
  Stopwatch _stopwatch;
  Timer _timer;

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    // re-render every 30ms
    _timer = Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }
    setState(() {}); // re-render the page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Color setup
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(formatTime(_stopwatch.elapsedMilliseconds),
                style: TextStyle(color: Colors.white, fontSize: 90.0)),
            SizedBox(
              height: 60.0,
            ),
            SizedBox(
              height: 50.0,
              width: 120.0,
              child: ElevatedButton(
                  onPressed: handleStartStop,
                  child: Text(
                    _stopwatch.isRunning ? 'Stop' : 'Start',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      //fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
