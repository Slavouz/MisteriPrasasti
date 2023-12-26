import 'dart:ui';

import 'package:flame/components.dart';
import 'package:misteri_prasasti/game/dimensions.dart';

class Ground extends PositionComponent {

  final _paint = Paint()..color = const Color(0xFFDDDAAA);
  final _gridPaint = Paint()..color = const Color(0xFFFFFF);
  final _colNum = 28;
  final _rowNum = 28;

  @override
  void update(double dt) {
    size = kTileSize.clone()..multiply(Vector2.all(_colNum * 1.0));
    position = kTileSize.clone()..multiply(Vector2.all(1));
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
    for (var i = 0; i < _colNum - 1; i++) {
    canvas.drawLine(
      Vector2(kTileSize.x * (i + 1), 0).toOffset(), 
      Vector2(kTileSize.x * (i + 1),size.y).toOffset(), 
      _gridPaint
      );
    }
    for (var i = 0; i < _rowNum - 1; i++) {
    canvas.drawLine(
      Vector2(0, kTileSize.y * (i + 1)).toOffset(), 
      Vector2(size.x, kTileSize.y * (i + 1)).toOffset(), 
      _gridPaint
      );
    }
  }
}