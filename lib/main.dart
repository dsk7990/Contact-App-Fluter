import 'dart:async';

import 'package:contactapp/HomePage.dart';
import 'package:contactapp/Login.dart';
import 'package:flutter/material.dart';

import 'helpers/Constants.dart';

void main() => runApp(ContactApp());

class ContactApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: appTitle,
      theme: new ThemeData(
        primaryColor: appPrimaryGreyColor,
        primaryColorDark: appPrimaryDarkGreyColor,
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/LoginScreen': (BuildContext context) => new LoginScreen(),
        '/HomePage': (BuildContext context) => new HomePage()
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/LoginScreen');
  }

  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: appPrimaryGreyColor,
      body: new Center(child: splashLogo),
    );
  }
}
