// ignore_for_file: public_member_api_docs

import 'package:change_color_test/domain/entities/color_entity.dart';
import 'package:change_color_test/internal/error/failure.dart';
import 'package:either_dart/either.dart';

abstract class Repository {
  Future<Either<Failure, ColorEntity>> generateIntegers();
}
