part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

sealed class HomeBlocActionState extends HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeBlocLoadingState extends HomeBlocState {}

class HomeBlocSuccessState extends HomeBlocState {}

class HomeBlocErrorState extends HomeBlocState {}

class HomeBlocNavigateToDetailsPageState extends HomeBlocActionState {}
