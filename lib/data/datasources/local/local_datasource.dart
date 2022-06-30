// ignore_for_file: public_member_api_docs

import 'dart:math';

import 'package:change_color_test/data/datasources/datasource.dart';
import 'package:change_color_test/domain/entities/color_entity.dart';
import 'package:change_color_test/internal/error/failure.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

class LocalDataSource extends DataSource {
  final _random = Random();
  final _min = 0;
  final _max = 255;

  Color _generateColor() {
    return Color.fromRGBO(_nextInt(), _nextInt(), _nextInt(), 1);
  }

  int _nextInt() => _min + _random.nextInt(_max - _min);

  @override
  Future<Either<Failure, ColorEntity>> getColor() async {
    return Right(
      ColorEntity(color: _generateColor(), lastColor: _generateColor()),
    );
  }
}
