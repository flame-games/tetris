import 'tetris.dart';
import 'dart:async';


class TetrisMain {
  late Tetris gameCore;
  late Timer gameLoop;

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
    gameLoop = Timer.periodic(const Duration(seconds: 1), (timer) { loop(); });
  }

  void loop() {
    cycle();
  }

  void cycle() {
    gameCore.cycle();
    consoleDisplay();
  }

  void consoleDisplay() {
    for (var console in gameCore.consoleDisplay) {
      print(console);
    }
  }
}