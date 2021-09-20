import 'package:flutter/material.dart';
import 'package:mecar_test/common/injection/injector.dart';

import 'bloc/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';

  RegisterScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  final RegisterBloc _registerBloc = sl<RegisterBloc>();

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

    return Center();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _registerBloc.close();
    super.dispose();
  }
}
