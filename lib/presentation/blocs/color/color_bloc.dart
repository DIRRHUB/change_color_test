// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'package:change_color_test/data/datasources/local/local_datasource.dart';
import 'package:change_color_test/data/datasources/remote/remote_datasource.dart';
import 'package:change_color_test/data/repositories/repository_implementation.dart';
import 'package:change_color_test/presentation/blocs/color/color_event.dart';
import 'package:change_color_test/presentation/blocs/color/color_state.dart';

class ColorBloc {
  final RepositoryImplementation _repository = RepositoryImplementation(
    localDataSource: LocalDataSource(),
    remoteDataSource: RemoteDataSource(),
  );
  final _state = ColorState();

  final _stateController = StreamController<ColorState>.broadcast();

  ColorState get state => _state;
  Stream<ColorState> get stream => _stateController.stream;

  ColorBloc() {
    dispatch(const OnTapEvent());
  }

  void dispatch(ColorEvent event) {
    if (event is OnTapEvent) {
      _changeColor();
    }
  }

  Future<void> _changeColor() async {
    final lastColor = _state.colors.color;
    final response = await _repository.generateIntegers();
    var color = lastColor;
    response.fold(
      (left) => null,
      (right) => color = right.color,
    );
    _state.colors = _state.colors.copyWith(color: color, lastColor: lastColor);
    _stateController.add(state);
  }

  void dispose() {
    _stateController.close();
  }
}
