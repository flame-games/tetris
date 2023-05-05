import 'tetris.dart';
import 'dart:async';


class TetrisMain {
  late Tetris gameCore;
  late Timer gameLoop;
  late Function renderCallbackHandler;

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

  List<dynamic> get displayBuffer => gameCore.displayBuffer;

  void setRenderCallback(Function fn) => renderCallbackHandler = fn;

  void loop() {
    cycle();
  }

  void cycle() {
    gameCore.cycle();
    renderCallbackHandler();
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
}