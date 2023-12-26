import 'dart:ui';

import 'package:flame/components.dart';
import 'package:misteri_prasasti/game/dimensions.dart';

class Hammer extends PositionComponent {
  final _paint = Paint()..color=const Color(0xFFAAAAAA);

  @override
  void update(double dt) {
    position = Vector2.all(100);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(kTileSize.toRect(), _paint);
  }
}