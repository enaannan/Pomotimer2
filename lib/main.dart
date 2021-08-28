import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomotimer2/screens/OnBoardingPage.dart';

import 'bloc/UsersInfoBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "PomoTimer",
    home: OnBoardingPage(),
    theme: ThemeData(primaryColor: Colors.white),
  );
  }
}
