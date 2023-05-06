import 'dart:math' as math;
import 'mino.dart';
import '../utility/config.dart';
import '../utility/mino_enum.dart';
import '../utility/deep_copy.dart';

class Tetris {
  List<List<int>> field = List.generate(fieldHeight, (i) => List.generate(fieldWidth, (i) => 0));
  late Mino mino;
  late Mino nextMino;

  Tetris({
    minoType = 0,
    minoAngle = 0,
    minoX = 5,
    minoY = 0,
    bool random = true
  }) {
    initField();

    if (random) {
      mino = getRandomMino();
      nextMino = getRandomMino();
    } else {
      mino = factoryMino(minoType, minoAngle, minoX, minoY);
      nextMino = getRandomMino();
    }
  }

  Mino factoryMino(int type, int angle, int x, int y) {
    return Mino(
      type: type,
      angle: angle,
      x: x,
      y: y,
    );
  }

  List<dynamic> get displayBuffer {
    var tmpDisplayBuffer = deepCopy(field);

    for (int i = 0; i < minoHeight; i++) {
      for (int j = 0; j < minoWidth; j++) {
        tmpDisplayBuffer[mino.y + i][getLimitFieldX(mino.x, j)] |=
        minoShapes[mino.type]![mino.angle]![i * minoWidth + j];
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

  Mino getRandomMino() {
    var random = math.Random();
    return Mino(type: random.nextInt(100) % MinoType.Max.index, angle: random.nextInt(100) % MinoAngle.a_max.index);
  }

  void changeMino() {
    mino = deepCopy(nextMino);
    nextMino = getRandomMino();
  }

  bool isHit(int minoX, int minoY, int minoType, int minoAngle) {
    for (int i = 0; i < minoHeight; i++) {
      for (int j = 0; j < minoWidth; j++) {
        if (minoShapes[minoType]![minoAngle]![i * minoWidth + j] > 0 && field[minoY + i][getLimitFieldX(minoX, j)] > 0) {
          return true;
        }
      }
    }
    return false;
  }

  void keyInput(input) {
    switch (input) {
      // case 'w': minoY++; break;
      case 'down':
        if (!isHit(mino.x, mino.y + 1, mino.type, mino.angle)) {
          mino.y++;
        }
        break;
      case 'left':
        if (!isHit(mino.x - 1, mino.y, mino.type, mino.angle)) {
          mino.x--;
        }
        break;
      case 'right':
        if (!isHit(mino.x + 1, mino.y, mino.type, mino.angle)) {
          mino.x++;
        }
        break;
      case 'rotate':
        if (!isHit(
            mino.x, mino.y, mino.type, (mino.angle + 1) % MinoAngle.a_max.index)) {
          mino.angle = (mino.angle + 1) % MinoAngle.a_max.index;
        }
        break;
    }
  }

  void cycle() {
    if(isHit(mino.x, mino.y + 1, mino.type, mino.angle)) {
      fieldMergeMino();
      lineFillCheck();
      changeMino();
    } else {
      mino.y++;
    }
  }

  void fieldMergeMino() {
    for (int i = 0; i < minoHeight; i++) {
      for (int j = 0; j < minoWidth; j++) {
        field[mino.y + i][getLimitFieldX(mino.x, j)] |= minoShapes[mino.type]![mino.angle]![i * minoWidth + j];
      }
    }
  }

  void lineFillCheck() {
    for (int i = 0; i < fieldHeight - 1; i++) {
      bool lineFill = true;
      for (int j = 1; j < fieldWidth - 1; j++) {
        if (field[i][j] == 0) {
          lineFill = false;
        }
      }

      if (lineFill) {
        for (int j = i; 0 < j; j--) {
          field[j] = [...field[j - 1]];
        }
      }
    }
  }

  int getLimitFieldX(int minoX, int j) {
    var fieldX = (minoX + j) <= 0 ? 0 : minoX + j;
    if ((minoX + j) >= fieldWidth - 1) fieldX = fieldWidth - 1;
    return fieldX;
  }
}