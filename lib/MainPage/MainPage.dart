import 'package:flutter/material.dart';
import 'package:slurp/MainPage/BottomNavBar.dart';
import 'package:slurp/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slurp/Home/HomePage.dart';
import 'package:slurp/MainPage/bloc/navigation_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    Homepage(),
    Center(
      child: Text('Search'),
    ),
    Center(
      child: Text('Liked'),
    ),
    Center(
      child: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final double horizontalPadding = size.width * 0.05; // 5% of screen width
    //final double verticalPadding = size.height * 0.02; // 2% of screen height
    final double appBarHeight = size.height * 0.08; // 8% of screen height
    final double titleFontSize = size.width * 0.07; // 6% of screen width
    final double iconSize = size.width * 0.08; // 6% of screen width

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Color(0xFFF3E3C5),
        //centerTitle: true,
        elevation: 0,
        toolbarHeight: appBarHeight,
        title: Text(
          'SluRp',
          style: TextStyle(
            fontFamily: 'Atop',
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 225, 160, 39),
          ),
        ),
        actions: [
          // Search Icon
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black87,
              size: iconSize,
            ),
            onPressed: () {
              // Handle search
              print('Search pressed');
            },
          ),
          // Cart Icon with Badge
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black87,
                  size: iconSize,
                ),
                onPressed: () {
                  // Handle cart
                  print('Cart pressed');
                },
              ),
              Positioned(
                right: size.width * 0.02, // 2% of screen width
                top: size.height * 0.01, // 1% of screen height
                child: Container(
                  padding: EdgeInsets.all(
                      size.width * 0.005), // 0.5% of screen width
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(
                        size.width * 0.025), // 2.5% of screen width
                  ),
                  constraints: BoxConstraints(
                    minWidth: size.width * 0.04, // 4% of screen width
                    minHeight: size.height * 0.02, // 2% of screen height
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.025, // 2.5% of screen width
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: size.width * 0.025), // 2.5% of screen width
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding:
            EdgeInsets.fromLTRB(size.width * 0.01, 0, size.width * 0.01, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF3E3C5),
              //Color(0xFFF4B679),
              Color(0xFFF6F6F6),
              //Color(0xFF5BE6F1),
              Color(0xFFCAF8FD),
            ],
          ),
        ),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) {
                int selectedIndex = 0;

                if (state is NavigationInitial) {
                  selectedIndex = state.selectedIndex;
                } else if (state is NavigationChanged) {
                  selectedIndex = state.selectedIndex;
                }

                return pages[selectedIndex];
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBar(),
            )
          ],
        ),
      ),
    );
  }
}
