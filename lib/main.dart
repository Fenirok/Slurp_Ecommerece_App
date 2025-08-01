import 'package:flutter/material.dart';
import 'package:slurp/MainPage/MainPage.dart';
import 'package:slurp/MainPage/bloc/navigation_bloc.dart';
import 'package:slurp/ThemeData/ColorScheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: MaterialApp(
        title: 'SluRp App',
        home: MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
