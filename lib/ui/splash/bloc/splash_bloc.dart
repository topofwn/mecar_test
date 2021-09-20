import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mecar_test/data/model/userAuth.dart';
import 'package:meta/meta.dart';
import 'package:package_info/package_info.dart';


import '../../../data/repository/user_repository.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserRepository userRepository;


  SplashBloc({
    @required this.userRepository,

  }) : super(null);


  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is FetchAuthorize) {
      await userRepository.getListUser();
    }
  }
}
