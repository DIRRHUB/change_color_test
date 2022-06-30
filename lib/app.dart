// ignore_for_file: public_member_api_docs

import 'package:change_color_test/presentation/blocs/color/color_bloc.dart';
import 'package:change_color_test/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider(
        create: (_) => ColorBloc(),
        child: const MainScreen(),
      ),
    );
  }
}
