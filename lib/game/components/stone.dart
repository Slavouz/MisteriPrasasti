import 'dart:ui';

import 'package:flame/components.dart';
import 'package:misteri_prasasti/game/dimensions.dart';

class Stone extends PositionComponent {

  final _paint = Paint()..color = const Color.fromARGB(255, 67, 59, 59);
  
  @override
  void update(double dt) {
    position = Vector2.all(400);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(kTileSize.toRect(), _paint);
  }
}