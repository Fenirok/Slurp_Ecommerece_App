import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slurp/MainPage/bloc/navigation_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double navBarHeight = size.height * 0.073; // 8.5% of screen height
    final double iconContainerSize = size.width * 0.13; // 15% of screen width
    final double iconSize = size.width * 0.07; // 7% of screen width
    final double horizontalPadding = size.width * 0.1; // 5% of screen width
    final double verticalPadding = size.height * 0.02; // 1.5% of screen height

    return BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
      int selectedIndex = 0;

      if (state is NavigationInitial) {
        selectedIndex = state.selectedIndex;
      } else if (state is NavigationChanged) {
        selectedIndex = state.selectedIndex;
      }

      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(navBarHeight / 2),
          child: Container(
            height: navBarHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyan),
              color: Colors.white,
              borderRadius: BorderRadius.circular(navBarHeight / 2),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavbar(
                    context,
                    Icons.home,
                    0,
                    Colors.amber[800]!,
                    Colors.white,
                    Colors.transparent,
                    Colors.black,
                    iconContainerSize,
                    iconSize,
                    selectedIndex),
                _buildNavbar(
                    context,
                    Icons.search,
                    1,
                    Colors.amber[800]!,
                    Colors.white,
                    Colors.transparent,
                    Colors.black,
                    iconContainerSize,
                    iconSize,
                    selectedIndex),
                _buildNavbar(
                    context,
                    Icons.favorite,
                    2,
                    Colors.amber[800]!,
                    Colors.white,
                    Colors.transparent,
                    Colors.black,
                    iconContainerSize,
                    iconSize,
                    selectedIndex),
                _buildNavbar(
                    context,
                    Icons.person,
                    3,
                    Colors.amber[800]!,
                    Colors.white,
                    Colors.transparent,
                    Colors.black,
                    iconContainerSize,
                    iconSize,
                    selectedIndex),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildNavbar(
    BuildContext context,
    IconData icon,
    int index,
    Color selectedColor,
    Color selectedIconColor,
    Color unselectedColor,
    Color unselectedIconColor,
    double iconContainerSize,
    double iconSize,
    int selectedIndex,
  ) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        context.read<NavigationBloc>().add(NavigationItemSelected(index));
      },
      child: Container(
        width: iconContainerSize,
        height: iconContainerSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? selectedColor : unselectedColor,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: isSelected ? selectedIconColor : unselectedIconColor,
        ),
      ),
    );
  }
}
