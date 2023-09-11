import 'package:fake_apis_project_with_block/bloc/productbloc.dart';
import 'package:fake_apis_project_with_block/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
