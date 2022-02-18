void TresEnRallaDosJugadores() {
  DibuixaTaulell();

  if (EspaciosLibres() <= 1) {
    NoEspaisCanvi();
    ganador = checkWinner();
    changeState(2);
  }
}

byte EspaciosLibres() {
  byte espaciosLibres = 0;
  for (int i = 0; i < tablero.length; i++) {
    for (int j = 0; j < tablero[i].length; j++) {
      if (tablero[i][j] == 0) espaciosLibres++;
    }
  }
  return espaciosLibres;
}

void TresEnRallaMaquina() {

}

void DibujaFicha() {
  int posX, posY;
  if (mouseX > 500 && mouseX < 800
    && mouseY > 200 && mouseY < 500)
  {
    if (mouseX < 600)      posX = 0;
    else if (mouseX < 700) posX = 1;
    else                   posX = 2;

    if (mouseY < 300)      posY = 0;
    else if (mouseY < 400) posY = 1;
    else                   posY = 2;

    if (tablero[posX][posY] == 0) {
      tablero[posX][posY] = playerTurn ? (byte)1 : (byte)-1;
      playerTurn = !playerTurn;
    }
  }
}

void NoEspaisCanvi() {
  for (int i = 0; i < tablero.length; i++) {
    for (int j = 0; j < tablero[i].length; j++) {
      if(tablero[i][j] == 0) {
        tablero[i][j] = playerTurn ? (byte)1 : (byte)-1;
      }
    }
  }
}

byte checkWinner() {
  //Diagonals
  if ( (tablero[0][0] == tablero[1][1] && tablero[1][1] == tablero[2][2])  //Diagonal \
    || (tablero[0][2] == tablero[1][1] && tablero[1][1] == tablero[2][0])  //Diagonal /
    &&  tablero[1][1] != 0) 
  {
   return tablero[1][1];
  }

  //Horitzontal i vertical
  for (int i = 0; i < tablero.length; i++) {
    if ( (tablero[i][0] == tablero[i][1] && tablero[i][1] == tablero[i][2])  //Horitzontal
      || (tablero[0][i] == tablero[1][i] && tablero[1][i] == tablero[2][i])  //Verical
      &&  tablero[1][1] != 0) 
    {
      return tablero[i][i];
    }
  }
  return 0;
}


void ComprobacionGanador() {
  ganador = checkWinner();
  if (ganador != 0) {
    DibuixaTaulell();
    changeState(2);
  }
}
