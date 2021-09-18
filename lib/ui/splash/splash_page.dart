

import 'package:flutter/cupertino.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/SplashScreen";

  SplashScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }

}

class SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBasicInfo();
  }

  void initBasicInfo() {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}