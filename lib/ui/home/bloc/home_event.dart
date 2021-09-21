part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SeeMoreButtonPressed extends HomeEvent {
  final int maxLength;
  const SeeMoreButtonPressed({
    @required this.maxLength
  });

  @override
  List<Object> get props => [maxLength];

  @override
  String toString() =>
      'SeeMoreButtonPressed { MaxLength: $maxLength}';
}

class ChangeTab extends HomeEvent {
  final int position;
  const ChangeTab({
    @required this.position
  });

  @override
  List<Object> get props => [position];

  @override
  String toString() =>
      'ChangeTab { Posistion: $position}';
}
