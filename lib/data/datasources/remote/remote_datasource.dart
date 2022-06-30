// ignore_for_file: public_member_api_docs

import 'package:change_color_test/data/datasources/datasource.dart';
import 'package:change_color_test/data/models/remote/generate_integers/response_model.dart';
import 'package:change_color_test/domain/entities/color_entity.dart';
import 'package:change_color_test/internal/error/failure.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';

class RemoteDataSource extends DataSource {
  final _dio = Dio();
  static const String _serverPath = "https://api.random.org/json-rpc/4/invoke";
  static const String _apiKey = "a29dcc19-91c1-4f30-ac65-068df3fa04b3";
  static const int _amountInRequest = 30;
  static const int _minNumber = 0;
  static const int _maxNumber = 255;

  List<ColorEntity> _cache = [];

  @override
  Future<Either<Failure, ColorEntity>> getColor() async {
    if (_cache.isEmpty) {
      final response = await _makeRequest();
      response.fold((left) => null, (right) => _cache = right);
      if (_cache.isEmpty) return const Left(SomeFailure());
    }
    final lastColorEntity = _cache.last;
    _cache.removeLast();

    return Right(lastColorEntity);
  }

  Future<Either<Failure, List<ColorEntity>>> _makeRequest() async {
    try {
      final params = {
        "jsonrpc": "2.0",
        "method": "generateIntegers",
        "params": {
          "apiKey": _apiKey,
          "n": _amountInRequest,
          "min": _minNumber,
          "max": _maxNumber,
          "replacement": true
        },
        "id": 1
      };

      final Response response = await _dio.post<Map<String, dynamic>>(
        _serverPath,
        data: params,
      );
      if (response.statusCode == 200) {
        final model =
            ResponseModel.fromJson(response.data as Map<String, dynamic>);
        final data = model.result.random.data;
        final List<ColorEntity> cache = [];

        for (int i = 0; i < _amountInRequest / 3; i++) {
          final color = Color.fromRGBO(data[i], data[i + 1], data[i + 2], 1);
          cache.add(ColorEntity(color: color, lastColor: color));
        }

        return Right(cache);
      } else {
        return const Left(SomeFailure());
      }
    } on Exception {
      return const Left(SomeFailure());
    }
  }
}
