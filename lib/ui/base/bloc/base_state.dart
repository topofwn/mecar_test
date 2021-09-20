part of 'base_bloc.dart';

@immutable
abstract class BaseBlocState {
  final List<UserAuth> userAuth;

  BaseBlocState({this.userAuth});
}

class BaseInitial extends BaseBlocState {
  BaseInitial({List<UserAuth> userAuth}) : super(userAuth: userAuth);
}


class LogoutState extends BaseBlocState {}
