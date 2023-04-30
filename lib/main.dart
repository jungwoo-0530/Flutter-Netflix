import 'package:flutter/material.dart';
import 'package:first_test_app/screen/home_screen.dart';
import 'package:first_test_app/widget/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue, brightness: Brightness.dark)
            .copyWith(secondary: Colors.black),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              const HomeScreen(),
              Container(
                child: const Center(
                  child: Text('search'),
                ),
              ),
              Container(
                  child: const Center(
                    child: Text('save'),
                  )
              ),
              Container(
                  child: const Center(
                    child: Text('more'),
                  )
              ),
            ],
          ),
          bottomNavigationBar: const Bottom(),
        ),
      ),
    );
  }
}
