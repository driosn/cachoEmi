class PointCalculator {

  static int calculateUnos(Map<int, int> dicesQuantity) {
    int diceNumber = 1;
    return diceNumber * dicesQuantity[diceNumber];
  }

  static int calculateDos(Map<int, int> dicesQuantity) {
    int diceNumber = 2;
    return diceNumber * dicesQuantity[diceNumber];
  }

  static int calculateTres(Map<int, int> dicesQuantity) {
    int diceNumber = 3;
    return diceNumber * dicesQuantity[diceNumber];
  }

  static int calculateCuatros(Map<int, int> dicesQuantity) {
    int diceNumber = 4;
    return diceNumber * dicesQuantity[diceNumber];
  }

  static int calculateCincos(Map<int, int> dicesQuantity) {
    int diceNumber = 5;
    return diceNumber * dicesQuantity[diceNumber];
  }

  static int calculateSeis(Map<int, int> dicesQuantity) {
    int diceNumber = 6;
    return diceNumber * dicesQuantity[diceNumber];
  }

  static int calculateDoble(Map<int, int> dicesQuantity) {
    int counterDoble = 0;
    dicesQuantity.forEach((key, value) {
      if(value == 2) counterDoble++;
    });
    return counterDoble == 2 ? 15 : 0;
  }

  static int calculateEscalera(Map<int, int> dicesQuantity) {
    int counterEscalera = 0;
    if(dicesQuantity[1] >= 1 && dicesQuantity[2] >= 1 && dicesQuantity[3] >= 1 && dicesQuantity[4] >= 1 && dicesQuantity[5] >= 1) counterEscalera = 1;
    if(dicesQuantity[2] >= 1 && dicesQuantity[3] >= 1 && dicesQuantity[4] >= 1 && dicesQuantity[5] >= 1 && dicesQuantity[6] >= 1) counterEscalera = 1;
    if(dicesQuantity[3] >= 1 && dicesQuantity[4] >= 1 && dicesQuantity[5] >= 1 && dicesQuantity[6] >= 1 && dicesQuantity[1] >= 1) counterEscalera = 1;
    return counterEscalera == 1 ? 25 : 0;
  }

  static int calculateFull(Map<int, int> dicesQuantity) {
    int counterThree = 0;
    int counterTwo = 0;
    dicesQuantity.forEach((key, value) {
      if(value == 2) counterTwo++;
      if(value == 3) counterThree++;
    });
    return (counterTwo == 1 && counterThree == 1) ? 35 : 0;
  }

  static int calculatePoker(Map<int, int> dicesQuantity) {
    int counterPoker = 0;
    dicesQuantity.forEach((key, value) {
      if(value == 4) counterPoker++;
    });
    return counterPoker == 1 ? 45 : 0;
  }

  static int calculateGrande(Map<int, int> dicesQuantity) {
    int counterGrande = 0;
    dicesQuantity.forEach((key, value) {
      if(value == 5) counterGrande++;
    });
    return counterGrande == 1 ? 50 : 0;
  }

  static int calculateGrande2(Map<int, int> dicesQuantity) {
    int counterGrande = 0;
    dicesQuantity.forEach((key, value) {
      if(value == 5) counterGrande++;
    });
    return counterGrande == 1 ? 50 : 0;
  }
}