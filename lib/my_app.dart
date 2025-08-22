import 'package:flutter/material.dart';
import 'package:solid_software/screen/home_screen_page.dart';

/// This is the main starting moin of the whole app.
class MyApp extends StatelessWidget {
  /// Constructor for the MyApp widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreenPage(),
    );
  }
}
