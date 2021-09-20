part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPress extends RegisterEvent {
  final String userName;
  final String password;
  final String rePassword;

  const RegisterButtonPress({
    @required this.userName,
    @required this.password,
    @required this.rePassword
  });

  @override
  List<Object> get props => [userName, password, rePassword];

  @override
  String toString() =>
      'LoginButtonPressed { phoneNumber: $userName, password: $password, rePassword: $rePassword }';
}


