part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable{
  final int tabPosition;
  final int listImageLength;

  HomeState({
    @required this.tabPosition,
    @required this.listImageLength,
  });

  factory HomeState.initial() {
    return HomeState(
      tabPosition: 2,
      listImageLength: 10
    );
  }

  HomeState copyWith({
    int tabPosition,
    int listImageLength
  }) {
    return HomeState(
      tabPosition: tabPosition ?? this.tabPosition,
      listImageLength: listImageLength ?? this.listImageLength,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
    tabPosition,
    listImageLength,
  ];

}

