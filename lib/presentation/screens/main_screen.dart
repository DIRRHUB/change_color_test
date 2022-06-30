// ignore_for_file: public_member_api_docs

import 'package:change_color_test/presentation/blocs/color/color_bloc.dart';
import 'package:change_color_test/presentation/blocs/color/color_event.dart';
import 'package:change_color_test/presentation/blocs/color/color_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void dispose() {
    context.read<ColorBloc>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ColorBloc>();

    return Scaffold(
      body: StreamBuilder<ColorState>(
        initialData: bloc.state,
        stream: bloc.stream,
        builder: (context, snapshot) {
          return Material(
            color: snapshot.requireData.colors.lastColor,
            child: InkWell(
              splashColor: snapshot.requireData.colors.color,
              onTap: () => bloc.dispatch(const OnTapEvent()),
              child: const SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Text(
                    "Hey there",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
