import 'package:tetris/utility/config.dart';

import 'tetris.dart';
import 'dart:async';

import 'mino.dart';
import '../utility/mino_enum.dart';

class TetrisMain {
  late Tetris gameCore;
  late Timer gameLoop;
  late Function renderCallbackHandler;
  late Function bottomHitCallbackHandler;

  TetrisMain({
    int minoType = 0,
    int minoAngle = 0,
    int minoX = 5,
    int minoY = 0,
    bool random = true
  }) {
    gameCore = Tetris(
      minoType: minoType,
      minoAngle: minoAngle,
      minoX: minoX,
      minoY: minoY,
      random: random,
    );
    gameLoop = Timer.periodic(const Duration(milliseconds: 1000), (timer) { loop(); });
  }

  List<dynamic> get displayBuffer => gameCore.displayBuffer;
  Mino get nextMino => gameCore.nextMino;
  List<int> get nextMinoShape => getMinoShape(nextMino);
  bool get isGameOver => gameCore.isGameOver;

  void setRenderCallback(Function fn) => renderCallbackHandler = fn;
  void setChangeMinoCallback(Function fn) => gameCore.setChangeMinoCallback(fn);

  void loop() {
    cycle();
  }

  void cycle() {
    renderCallbackHandler();

    if (!gameCore.cycle()) {
      gameLoop.cancel();
      // gameCore.cycle();
      renderCallbackHandler();
    }
  }

  void keyInput(input) {
    gameCore.keyInput(input);
    renderCallbackHandler();
  }

  void consoleDisplay() {
    for (var console in gameCore.consoleDisplay) {
      print(console);
    }
  }

  getMinoShape(mino) => minoShapes[mino.type]?[mino.angle];

  // get nextMinoShapeArray => nextMinoShape.slices(minoWidth);
  get nextMinoShapeArray {
    var splitArray = [];
    for (var i = 0; i < nextMinoShape.length; i += minoWidth) {
      var end = (i + minoWidth < nextMinoShape.length) ? i + minoWidth : nextMinoShape.length;
      splitArray.add(nextMinoShape.sublist(i, end));
    }
    return splitArray;
  }

}