import 'dart:math' as math;
import '../utility/config.dart';
import '../utility/mino_enum.dart';
import '../utility/deep_copy.dart';

class Tetris {
  int minoType = 0, minoAngle = 0;
  int minoX = 5, minoY = 0;
  List<List<int>> field = List.generate(fieldHeight, (i) => List.generate(fieldWidth, (i) => 0));

  Tetris() {
    initField();
    resetMino();
    for (var console in consoleDisplay) {
      print(console);
    }
  }

  List<dynamic> get displayBuffer {
    var tmpDisplayBuffer = deepCopy(field);

    for (int i = 0; i < minoHeight; i++) {
      for (int j = 0; j < minoWidth; j++) {
        tmpDisplayBuffer[minoY + i][minoX + j] |=
        minoShapes[minoType]![minoAngle]![i * minoWidth + j];
      }
    }
    return tmpDisplayBuffer;
  }

  List<dynamic> get consoleDisplay {
    var tmpConsoleDisplay = deepCopy(displayBuffer);
    for (int i = 0; i < fieldHeight; i++) {
      for (int j = 0; j < fieldWidth; j++) {
        tmpConsoleDisplay[i][j] = tmpConsoleDisplay[i][j] > 0 ? "口" : "  ";
      }
    }
    return tmpConsoleDisplay;
  }

  initField() {
    for (int i = 0; i < fieldHeight; i++) {
      field[i][0] = field[i][fieldWidth - 1] = 1;
    }
    for (int i = 0; i < fieldWidth; i++) {
      field.last[i] = 1;
    }
  }

  void resetMino() {
    var random = math.Random();
    minoX = 5;
    minoY = 0;
    minoType = random.nextInt(100) % MinoType.Max.index;
    minoAngle = random.nextInt(100) % Mino.angle_max.index;
  }

  bool isHit(int minoX, int minoY, int minoType, int minoAngle) {
    for (int i = 0; i < minoHeight; i++) {
      for (int j = 0; j < minoWidth; j++) {
        if (minoShapes[minoType]![minoAngle]![i * minoWidth + j] > 0 && field[minoY + i][minoX + j] > 0) {
           return true;
        }
      }
    }
    return false;
  }

  void keyInput(input) {
    switch (input) {
      // case 'w': minoY++; break;
      case 's':
        if (!isHit(minoX, minoY + 1, minoType, minoAngle)) {
          minoY++;
        }
        break;
      case 'a':
        if (!isHit(minoX - 1, minoY, minoType, minoAngle)) {
          minoX--;
        }
        break;
      case 'd':
        if (!isHit(minoX + 1, minoY, minoType, minoAngle)) {
          minoX++;
        }
        break;
      case 0x20:
        if (!isHit(
            minoX, minoY, minoType, (minoAngle + 1) % Mino.angle_max.index)) {
          minoAngle = (minoAngle + 1) % Mino.angle_max.index;
        }
        break;
    }
    // display();
  }

  void cycle() {
    if(isHit(minoX, minoY + 1, minoType, minoAngle)) {
      for (int i = 0; i < minoHeight; i++) {
        for (int j = 0; j < minoWidth; j++) {
          field[minoY + i][minoX + j] |= minoShapes[minoType]![minoAngle]![i * minoWidth + j];
        }
      }

      for (int i = 0; i < fieldHeight - 1; i++) {
        bool lineFill = true;
        for (int j = 1; j < fieldWidth - 1; j++) {
          if (field[i][j] == 0) {
            lineFill = false;
          }
        }

        if (lineFill) {
          for (int j = i; 0 < j; j--) {
            field[j] = deepCopy(field[j - 1]);
          }
        }
      }
      resetMino();
    } else {
      minoY++;
    }
    // display();
  }
}