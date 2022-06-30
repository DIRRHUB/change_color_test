// ignore_for_file: public_member_api_docs

import 'package:json_annotation/json_annotation.dart';
part 'random_model.g.dart';

@JsonSerializable()
class RandomModel {
  final List<int> data;

  RandomModel({
    required this.data,
  });

  factory RandomModel.fromJson(Map<String, dynamic> json) =>
      _$RandomModelFromJson(json);
}
