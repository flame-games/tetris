import 'package:flame/components.dart' hide Timer;
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart' show Colors;

import 'package:tetris/core/tetris_main.dart';
import 'utility/direction.dart';
import 'utility/config.dart';

class MainGame extends FlameGame with KeyboardEvents, HasGameRef {
  TetrisMain _tetris = TetrisMain();

  final List<RectangleComponent> _wallComponentList = [];
  final List<RectangleComponent> _rectComponentList = [];

  // @override
  // Color backgroundColor() => const Color.fromRGBO(89, 106, 108, 1.0);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await draw();

    _tetris.setRenderCallback(renderCallback);
  }

  Future<void> draw() async {
    for (var y = 0; y < _tetris.displayBuffer.length; y++) {
      final row = _tetris.displayBuffer[y];
      for (var x = 0; x < row.length; x++) {
        if (row[x] == 1) {
          _wallComponentList.add(createBlock(x + 1, y + 1, getBlockPaint(row[x])));
        } else if (row[x] > 1) {
          _rectComponentList.add(createBlock(x + 1, y + 1, getBlockPaint(row[x])));
        }
      }
    }

    for(var wall in _wallComponentList) {
      add(wall);
    }
    for(var rect in _rectComponentList) {
      add(rect);
    }
    // camera.followVector2(Vector2(pushGame.state.width * oneBlockSize / 2, pushGame.state.height * oneBlockSize / 2));
  }

  renderCallback() {
    resetRenderMino();
    renderMino();
  }

  createBlock(int x, int y, Paint paint) {
    return RectangleComponent(
      position: Vector2(oneBlockSize * x, oneBlockSize * y),
      size: Vector2.all(oneBlockSize),
      paint: paint,
    );
  }

  getBlockPaint(int no) {
    if (no == 1) {
      return paintMap['wall'];
    }
    final List<String> minoStringList = ['I', 'O', 'S', 'Z', 'J', 'L', 'T'];
    return paintMap['mino${minoStringList[no - 2]}'];
  }

  void resetRenderMino() {
    for (var rect in _rectComponentList) {
      remove(rect);
    }
    _rectComponentList.clear();
  }

  void renderMino() {
    for (var y = 0; y < _tetris.displayBuffer.length; y++) {
      final row = _tetris.displayBuffer[y];
      for (var x = 0; x < row.length; x++) {
        if (row[x] > 1) {
          _rectComponentList.add(createBlock(x + 1, y + 1, getBlockPaint(row[x])));
        }
      }
    }
    for(var rect in _rectComponentList) {
      add(rect);
    }
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;
    Direction keyDirection = Direction.none;

    if (!isKeyDown) {
      return super.onKeyEvent(event, keysPressed);
    }

    keyDirection = getKeyDirection(event);
    if (keyDirection != Direction.none) {
      _tetris.keyInput(keyDirection.name);
    }
    return super.onKeyEvent(event, keysPressed);
  }

  Direction getKeyDirection(RawKeyEvent event) {
    Direction keyDirection = Direction.none;
    if (event.logicalKey == LogicalKeyboardKey.keyA ||
        event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      keyDirection = Direction.left;
    } else if (event.logicalKey == LogicalKeyboardKey.keyD ||
        event.logicalKey == LogicalKeyboardKey.arrowRight) {
      keyDirection = Direction.right;
    } else if (event.logicalKey == LogicalKeyboardKey.keyW ||
        event.logicalKey == LogicalKeyboardKey.arrowUp) {
      keyDirection = Direction.up;
    } else if (event.logicalKey == LogicalKeyboardKey.keyS ||
        event.logicalKey == LogicalKeyboardKey.arrowDown) {
      keyDirection = Direction.down;
    } else if (event.logicalKey == LogicalKeyboardKey.space) {
      keyDirection = Direction.rotate;
    }
    return keyDirection;
  }
}
