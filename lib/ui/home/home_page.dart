import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mecar_test/common/injection/injector.dart';
import 'package:mecar_test/ui/base/base_widget.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends BaseWidget {
  static const routeName = '/HomeScreen';

  HomeScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends BaseState<HomeScreen> {
  final HomeBloc _homeBloc = sl<HomeBloc>();

  @override
  void initState() {
    super.initState();
    //Call this method first when LoginScreen init
    initBasicInfo();
  }

  void initBasicInfo() {
  }
  
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _homeBloc.close();
    super.dispose();
  }
}
