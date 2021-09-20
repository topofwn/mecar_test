part of 'register_bloc.dart';

@immutable
class RegisterState extends Equatable {
  final RegisterStatus status;
  final bool isUserNameValid;
  final bool isPasswordValid;
  final bool isPasswordTheSame;

  RegisterState({
    @required this.isUserNameValid,
    @required this.isPasswordValid,
    @required this.isPasswordTheSame,
    this.status,
  });

  factory RegisterState.initial() {
    return RegisterState(
     isPasswordTheSame: true,
      isPasswordValid: true,
      isUserNameValid: true,
      status: RegisterStatus.idle,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
    isUserNameValid,
    isPasswordValid,
    isPasswordTheSame,
    status,
  ];
}


enum RegisterStatus {
  idle,
  success,
  fail
}