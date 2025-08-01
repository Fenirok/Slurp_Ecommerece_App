import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:slurp/model/Products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial()) {
    on<NavigationItemSelected>(_onNavigationItemSelected);
    on<NavigateToProductDetails>(_onNavigateToProductDetails); // ✅ NEW
  }

  void _onNavigationItemSelected(
    NavigationItemSelected event,
    Emitter<NavigationState> emit,
  ) {
    emit(NavigationChanged(event.index));
  }

  // ✅ New handler for navigating to product details
  void _onNavigateToProductDetails(
    NavigateToProductDetails event,
    Emitter<NavigationState> emit,
  ) {
    emit(ProductDetailsNavigation(event.product));
  }
}
