part of 'navigation_bloc.dart';

abstract class NavigationState {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {
  final int selectedIndex;

  const NavigationInitial({this.selectedIndex = 0});

  @override
  List<Object> get props => [selectedIndex];
}

class NavigationChanged extends NavigationState {
  final int selectedIndex;

  const NavigationChanged(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class ProductDetailsNavigation extends NavigationState {
  final Product product;

  const ProductDetailsNavigation(this.product);

  @override
  List<Object> get props => [product];
}
