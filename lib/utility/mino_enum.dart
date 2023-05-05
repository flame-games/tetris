enum MinoAngle {
  a_0,
  a_90,
  a_180,
  a_270,
  a_max,
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
    MinoAngle.a_0.index: [
      0, 2, 0, 0,
      0, 2, 0, 0,
      0, 2, 0, 0,
      0, 2, 0, 0
    ],
    MinoAngle.a_90.index: [
      0, 0, 0, 0,
      0, 0, 0, 0,
      2, 2, 2, 2,
      0, 0, 0, 0
    ],
    MinoAngle.a_180.index: [
      0, 0, 2, 0,
      0, 0, 2, 0,
      0, 0, 2, 0,
      0, 0, 2, 0
    ],
    MinoAngle.a_270.index: [
      0, 0, 0, 0,
      2, 2, 2, 2,
      0, 0, 0, 0,
      0, 0, 0, 0
    ],
  },
  MinoType.O.index: {
    MinoAngle.a_0.index: [
      0, 0, 0, 0,
      0, 3, 3, 0,
      0, 3, 3, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_90.index: [
      0, 0, 0, 0,
      0, 3, 3, 0,
      0, 3, 3, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_180.index: [
      0, 0, 0, 0,
      0, 3, 3, 0,
      0, 3, 3, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_270.index: [
      0, 0, 0, 0,
      0, 3, 3, 0,
      0, 3, 3, 0,
      0, 0, 0, 0
    ],
  },
  MinoType.S.index: {
    MinoAngle.a_0.index: [
      0, 0, 0, 0,
      0, 4, 4, 0,
      4, 4, 0, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_90.index: [
      0, 4, 0, 0,
      0, 4, 4, 0,
      0, 0, 4, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_180.index: [
      0, 0, 0, 0,
      0, 4, 4, 0,
      4, 4, 0, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_270.index: [
      0, 0, 0, 0,
      0, 4, 0, 0,
      0, 4, 4, 0,
      0, 0, 4, 0
    ],
  },
  MinoType.Z.index: {
    MinoAngle.a_0.index: [
      0, 0, 0, 0,
      5, 5, 0, 0,
      0, 5, 5, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_90.index: [
      0, 0, 0, 0,
      0, 0, 5, 0,
      0, 5, 5, 0,
      0, 5, 0, 0
    ],
    MinoAngle.a_180.index: [
      0, 0, 0, 0,
      0, 5, 5, 0,
      0, 0, 5, 5,
      0, 0, 0, 0
    ],
    MinoAngle.a_270.index: [
      0, 0, 5, 0,
      0, 5, 5, 0,
      0, 5, 0, 0,
      0, 0, 0, 0
    ],
  },
  MinoType.J.index: {
    MinoAngle.a_0.index: [
      0, 0, 6, 0,
      0, 0, 6, 0,
      0, 6, 6, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_90.index: [
      0, 0, 0, 0,
      6, 6, 6, 0,
      0, 0, 6, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_180.index: [
      0, 0, 0, 0,
      0, 6, 6, 0,
      0, 6, 0, 0,
      0, 6, 0, 0
    ],
    MinoAngle.a_270.index: [
      0, 0, 0, 0,
      0, 6, 0, 0,
      0, 6, 6, 6,
      0, 0, 0, 0
    ],
  },
  MinoType.L.index: {
    MinoAngle.a_0.index: [
      0, 7, 0, 0,
      0, 7, 0, 0,
      0, 7, 7, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_90.index: [
      0, 0, 0, 0,
      0, 0, 7, 0,
      7, 7, 7, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_180.index: [
      0, 0, 0, 0,
      0, 7, 7, 0,
      0, 0, 7, 0,
      0, 0, 7, 0
    ],
    MinoAngle.a_270.index: [
      0, 0, 0, 0,
      0, 7, 7, 7,
      0, 7, 0, 0,
      0, 0, 0, 0
    ],
  },
  MinoType.T.index: {
    MinoAngle.a_0.index: [
      0, 0, 0, 0,
      8, 8, 8, 0,
      0, 8, 0, 0,
      0, 0, 0, 0
    ],
    MinoAngle.a_90.index: [
      0, 0, 0, 0,
      0, 8, 0, 0,
      0, 8, 8, 0,
      0, 8, 0, 0
    ],
    MinoAngle.a_180.index: [
      0, 0, 0, 0,
      0, 0, 8, 0,
      0, 8, 8, 8,
      0, 0, 0, 0
    ],
    MinoAngle.a_270.index: [
      0, 0, 8, 0,
      0, 8, 8, 0,
      0, 0, 8, 0,
      0, 0, 0, 0
    ],
  },
};
