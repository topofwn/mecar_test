import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is SeeMoreButtonPressed) {
      yield state.copyWith(listImageLength: event.maxLength);
    } else if (event is ChangeTab) {
      yield state.copyWith(tabPosition: event.position);
    }
  }
}
