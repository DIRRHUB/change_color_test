// ignore_for_file: public_member_api_docs

import 'package:change_color_test/data/models/remote/generate_integers/result_random_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  ResultRandomModel result;

  ResponseModel({
    required this.result,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}
