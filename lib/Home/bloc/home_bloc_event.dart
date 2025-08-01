part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeBlocCartButtonPressedEvent extends HomeBlocEvent {}

class HomeBlocProductItemPressedEvent extends HomeBlocEvent {}

class HomeBlocNavigateToProductDetailsPageEvent extends HomeBlocEvent {}
