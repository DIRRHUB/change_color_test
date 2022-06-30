// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';

class ColorEntity {
  final Color color;
  final Color lastColor;

  @override
  int get hashCode => color.hashCode ^ lastColor.hashCode;

  const ColorEntity({
    required this.color,
    required this.lastColor,
  });

  const ColorEntity.empty({
    this.color = Colors.white,
    this.lastColor = Colors.white,
  });

  ColorEntity copyWith({
    Color? color,
    Color? lastColor,
  }) {
    return ColorEntity(
      color: color ?? this.color,
      lastColor: lastColor ?? this.lastColor,
    );
  }

  @override
  String toString() => 'ColorEntity(color: $color, lastColor: $lastColor)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorEntity &&
        other.color == color &&
        other.lastColor == lastColor;
  }
}
