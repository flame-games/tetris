enum Mino {
  angle_0,
  angle_90,
  angle_180,
  angle_270,
  angle_max,
}

enum MinoType {
  I,
  O,
  S,
  Z,
  J,
  L,
  T,
  Max,
}

Map<int, Map<int, List<int>>> minoShapes = {
  MinoType.I.index: {
    Mino.angle_0.index: [
      0, 1, 0, 0,
      0, 1, 0, 0,
      0, 1, 0, 0,
      0, 1, 0, 0
    ],
    Mino.angle_90.index: [
      0, 0, 0, 0,
      0, 0, 0, 0,
      1, 1, 1, 1,
      0, 0, 0, 0
    ],
    Mino.angle_180.index: [
      0, 0, 1, 0,
      0, 0, 1, 0,
      0, 0, 1, 0,
      0, 0, 1, 0
    ],
    Mino.angle_270.index: [
      0, 0, 0, 0,
      1, 1, 1, 1,
      0, 0, 0, 0,
      0, 0, 0, 0
    ],
  },
  MinoType.O.index: {
    Mino.angle_0.index: [
      0, 0, 0, 0,
      0, 1, 1, 0,
      0, 1, 1, 0,
      0, 0, 0, 0
    ],
    Mino.angle_90.index: [
      0, 0, 0, 0,
      0, 1, 1, 0,
      0, 1, 1, 0,
      0, 0, 0, 0
    ],
    Mino.angle_180.index: [
      0, 0, 0, 0,
      0, 1, 1, 0,
      0, 1, 1, 0,
      0, 0, 0, 0
    ],
    Mino.angle_270.index: [
      0, 0, 0, 0,
      0, 1, 1, 0,
      0, 1, 1, 0,
      0, 0, 0, 0
    ],
  },
  MinoType.S.index: {
    Mino.angle_0.index: [
      0, 0, 0, 0,
      0, 1, 1, 0,
      1, 1, 0, 0,
      0, 0, 0, 0
    ],
    Mino.angle_90.index: [
      0, 1, 0, 0,
      0, 1, 1, 0,
      0, 0, 1, 0,
      0, 0, 0, 0
    ],
    Mino.angle_180.index: [
      0, 0, 0, 0,
      0, 1, 1, 0,
      1, 1, 0, 0,
      0, 0, 0, 0
    ],
    Mino.angle_270.index: [
      0, 0, 0, 0,
      0, 1, 0, 0,
      0, 1, 1, 0,
      0, 0, 1, 0
    ],
  },
  MinoType.Z.index: {
    Mino.angle_0.index: [
      0, 0, 0, 0,
      1, 1, 0, 0,
      0, 1, 1, 0,
      0, 0, 0, 0
    ],
    Mino.angle_90.index: [
      0, 0, 0, 0,
      0, 0, 1, 0,
      0, 1, 1, 0,
      0, 1, 0, 0
    ],
    Mino.angle_180.index: [
      0, 0, 0, 0,
      0, 1, 1, 0,
      0, 0, 1, 1,
      0, 0, 0, 0
    ],
    Mino.angle_270.index: [
      0, 0, 1, 0,
      0, 1, 1, 0,
      0, 1, 0, 0,
      0, 0, 0, 0
    ],
  },
  MinoType.J.index: {
    Mino.angle_0.index: [
      0, 0, 1, 0,
      0, 0, 1, 0,
      0, 1, 1, 0,
      0, 0, 0, 0
    ],
    Mino.angle_90.index: [
      0, 0, 0, 0,
      1, 1, 1, 0,
      0, 0, 1, 0,
      0, 0, 0, 0
    ],
    Mino.angle_180.index: [
      0, 0, 0, 0,
      0, 1, 1, 0,
      0, 1, 0, 0,
      0, 1, 0, 0
    ],
    Mino.angle_270.index: [
      0, 0, 0, 0,
      0, 1, 0, 0,
      0, 1, 1, 1,
      0, 0, 0, 0
    ],
  },
  MinoType.L.index: {
    Mino.angle_0.index: [
      0, 1, 0, 0,
      0, 1, 0, 0,
      0, 1, 1, 0,
      0, 0, 0, 0
    ],
    Mino.angle_90.index: [
      0, 0, 0, 0,
      0, 0, 1, 0,
      1, 1, 1, 0,
      0, 0, 0, 0
    ],
    Mino.angle_180.index: [
      0, 0, 0, 0,
      0, 1, 1, 0,
      0, 0, 1, 0,
      0, 0, 1, 0
    ],
    Mino.angle_270.index: [
      0, 0, 0, 0,
      0, 1, 1, 1,
      0, 1, 0, 0,
      0, 0, 0, 0
    ],
  },
  MinoType.T.index: {
    Mino.angle_0.index: [
      0, 0, 0, 0,
      1, 1, 1, 0,
      0, 1, 0, 0,
      0, 0, 0, 0
    ],
    Mino.angle_90.index: [
      0, 0, 0, 0,
      0, 1, 0, 0,
      0, 1, 1, 0,
      0, 1, 0, 0
    ],
    Mino.angle_180.index: [
      0, 0, 0, 0,
      0, 0, 1, 0,
      0, 1, 1, 1,
      0, 0, 0, 0
    ],
    Mino.angle_270.index: [
      0, 0, 1, 0,
      0, 1, 1, 0,
      0, 0, 1, 0,
      0, 0, 0, 0
    ],
  },
};
