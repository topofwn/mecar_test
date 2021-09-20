import 'dart:async';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mecar_test/common/injection/injector.dart';
import 'package:mecar_test/data/source/local/pref/app_preferences.dart';
import 'package:mecar_test/ui/splash/splash_page.dart';
import 'package:mecar_test/utils/navigate_util.dart';


import '../../data/repository/user_repository.dart';

import 'bloc/base_bloc.dart';

class BaseWidget extends StatefulWidget {
  BaseWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BaseState();
  }
}

class BaseState<T extends BaseWidget> extends State<T> {
  bool canTouchToHideKeyboard = false;
  bool canClickOnBackPress = false;
  bool isFirstTimeInit = true;
  bool canTriggerOnBack = false;
  final _baseBloc = sl<BaseBloc>();
  StreamSubscription streamSubscriptionBase;
  StreamSubscription streamNotificationBase;

  void needHideKeyboard() {
    canTouchToHideKeyboard = true;
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  void canClickBackPress() {
    canClickOnBackPress = true;
  }

  @override
  void initState() {
    super.initState();

    streamSubscriptionBase = _baseBloc.listen((state) {
   if (state is LogoutState) {
        final appprefer = sl<AppPreferences>();
          NavigateUtil.pop(context,
              routeName: SplashScreen.routeName, release: true);
      }
    });

  }


  @override
  void dispose() {
    super.dispose();
    streamSubscriptionBase?.cancel();
    streamNotificationBase?.cancel();
  }

  void hideKeyboard() {}
}
