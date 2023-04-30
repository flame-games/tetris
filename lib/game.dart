import 'package:flame/components.dart' hide Timer;
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:tetris/core/tetris.dart';

class MainGame extends FlameGame with KeyboardEvents, HasGameRef {
  Tetris _tetris = Tetris();

  @override
  Color backgroundColor() => const Color.fromRGBO(89, 106, 108, 1.0);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await draw();
  }

  Future<void> draw() async {
    // camera.followVector2(Vector2(pushGame.state.width * oneBlockSize / 2, pushGame.state.height * oneBlockSize / 2));
  }

  // @override
  // KeyEventResult onKeyEvent(
  //     RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
  //   final isKeyDown = event is RawKeyDownEvent;
  //   Direction keyDirection = Direction.none;
  //
  //   if (!isKeyDown || _player.moveCount != 0 || pushGame.state.isClear) {
  //     return super.onKeyEvent(event, keysPressed);
  //   }
  //
  //   keyDirection = getKeyDirection(event);
  //   bool isMove = pushGame.changeState(keyDirection.name);
  //   if (isMove) {
  //     playerMove(isKeyDown, keyDirection);
  //     if (pushGame.state.isCrateMove) {
  //       createMove();
  //     }
  //     if (pushGame.state.isClear) {
  //       stateCallbackHandler(pushGame.state.isClear);
  //       Timer(const Duration(seconds: 3), drawNextStage);
  //     }
  //   }
  //   return super.onKeyEvent(event, keysPressed);
  // }
  //
  // Direction getKeyDirection(RawKeyEvent event) {
  //   Direction keyDirection = Direction.none;
  //   if (event.logicalKey == LogicalKeyboardKey.keyA ||
  //       event.logicalKey == LogicalKeyboardKey.arrowLeft) {
  //     keyDirection = Direction.left;
  //   } else if (event.logicalKey == LogicalKeyboardKey.keyD ||
  //       event.logicalKey == LogicalKeyboardKey.arrowRight) {
  //     keyDirection = Direction.right;
  //   } else if (event.logicalKey == LogicalKeyboardKey.keyW ||
  //       event.logicalKey == LogicalKeyboardKey.arrowUp) {
  //     keyDirection = Direction.up;
  //   } else if (event.logicalKey == LogicalKeyboardKey.keyS ||
  //       event.logicalKey == LogicalKeyboardKey.arrowDown) {
  //     keyDirection = Direction.down;
  //   }
  //   return keyDirection;
  // }
}
