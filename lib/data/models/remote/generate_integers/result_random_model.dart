// ignore_for_file: public_member_api_docs
import 'package:change_color_test/data/models/remote/generate_integers/random_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result_random_model.g.dart';

@JsonSerializable()
class ResultRandomModel {
  @JsonKey(name: "random")
  final RandomModel random;

  ResultRandomModel(this.random);

  factory ResultRandomModel.fromJson(Map<String, dynamic> json) =>
      _$ResultRandomModelFromJson(json);
}
