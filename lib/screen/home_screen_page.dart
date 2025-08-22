import 'dart:math';

import 'package:flutter/material.dart';

/// This is the main screen of the app. It's a StatefulWidget that changes
/// the background color of the screen..
class HomeScreenPage extends StatefulWidget {
  /// Constructor for the HomeScreenPage widget.
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  Color backgroundColor = Colors.white;

  Random random = Random();

  int tapNumber = 0;

  String greeting = '';

  static const duration = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    greeting = greetingFunction();
  }

  /// Changes the background color of the screen.
  void changeBackgroundColor() {
    final int red = random.nextInt(256);
    final int green = random.nextInt(256);
    final int blue = random.nextInt(256);
    const double opacity = 1.0;
    setState(() {
      backgroundColor = Color.fromRGBO(red, green, blue, opacity);

      tapNumber += 1;
      greeting = greetingFunction();
    });
  }

  /// Returns a greeting based on the current time.
  String greetingFunction() {
    final DateTime now = DateTime.now();
    final int hour = now.hour;
    const morning = 12;
    const afternoon = 12;

    if (hour < morning) {
      return 'Good morning';
    } else if (hour < afternoon) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeBackgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedContainer(
          color: backgroundColor,
          duration: duration,
          curve: Curves.easeIn,
          child: Center(
            child: AnimatedDefaultTextStyle(
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: getForegroundColor(),
              ),
              duration: duration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(greeting),
                  const SizedBox(height: 20),
                  const Text('Hello there'),

                  const SizedBox(height: 20),

                  Text('Taps: $tapNumber'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Returns the foreground color of the screen.
  Color getForegroundColor() {
    const luminance = 0.5;

    return backgroundColor.computeLuminance() > luminance
        ? Colors.black
        : Colors.white;
  }
}
