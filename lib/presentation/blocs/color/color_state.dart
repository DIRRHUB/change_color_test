// ignore_for_file: public_member_api_docs
import 'package:change_color_test/domain/entities/color_entity.dart';

class ColorState {
  ColorEntity colors;

  @override
  int get hashCode => colors.hashCode;

  ColorState({
    this.colors = const ColorEntity.empty(),
  });

  ColorState copyWith({
    ColorEntity? colors,
  }) {
    return ColorState(
      colors: colors ?? this.colors,
    );
  }

  @override
  String toString() => 'ColorState(colors: $colors)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ColorState && other.colors == colors;
  }
}
