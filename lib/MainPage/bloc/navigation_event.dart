part of 'navigation_bloc.dart';

abstract class NavigationEvent {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationItemSelected extends NavigationEvent {
  final int index;

  const NavigationItemSelected(this.index);

  @override
  List<Object> get props => [index];
}

class NavigateToProductDetails extends NavigationEvent {
  final Product product;

  const NavigateToProductDetails(this.product);

  @override
  List<Object> get props => [product];
}
