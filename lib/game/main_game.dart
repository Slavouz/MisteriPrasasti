import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:misteri_prasasti/game/components/ground.dart';
import 'package:misteri_prasasti/game/components/hammer.dart';
import 'package:misteri_prasasti/game/components/stone.dart';
import 'package:misteri_prasasti/game/dimensions.dart';

class MainGame extends FlameGame {
    final world = World();
    late final cameraComponent = CameraComponent(world: world);
  @override
  FutureOr<void> onLoad() {
    addAll([
      world,
      cameraComponent,
    ]);

    
    cameraComponent.viewfinder.visibleGameSize =kGameSize;
    cameraComponent.viewfinder.anchor = Anchor.topLeft;

       final ground = Ground();
       final hammer = Hammer();
       final stone = Stone();

       world.addAll([
        ground,
        hammer,
        stone,
       ]);

  }
}