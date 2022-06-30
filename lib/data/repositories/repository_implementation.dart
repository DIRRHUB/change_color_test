// ignore_for_file: public_member_api_docs

import 'package:change_color_test/data/datasources/local/local_datasource.dart';
import 'package:change_color_test/data/datasources/remote/remote_datasource.dart';
import 'package:change_color_test/domain/entities/color_entity.dart';
import 'package:change_color_test/domain/repositories/repository.dart';
import 'package:change_color_test/internal/error/failure.dart';
import 'package:either_dart/either.dart';

class RepositoryImplementation extends Repository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  RepositoryImplementation({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, ColorEntity>> generateIntegers() async {
    var colorEntity = const ColorEntity.empty();
    final response = remoteDataSource.getColor();

    ///Try get colorEntity from remoteDataSource
    ///Get from localDataSource if failure is thrown

    Future<ColorEntity> generateLocalIntegers() async {
      var colorEntity = const ColorEntity.empty();
      await localDataSource.getColor().fold(
            (left) => null,
            (right) => colorEntity = right,
          );

      return colorEntity;
    }

    await response.fold(
      (left) async => colorEntity = await generateLocalIntegers(),
      (right) => colorEntity = right,
    );

    return Right(colorEntity);
  }
}
