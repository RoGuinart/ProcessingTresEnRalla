void TresEnRallaDosJugadores() {
  DibuixaTaulell();

  if (EspaciosLibres() == 0) {
    ganador = checkWinner();
    gameState = 2;
    text("El jugador " + ganador + " ha ganado!", 500, 120, 20);
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
  if (mouseX > 490 && mouseX < 790
    && mouseY > 210 && mouseY < 510)
  {
    if (mouseX < 590)      posX = 0;
    else if (mouseX < 690) posX = 1;
    else                  posX = 2;

    if (mouseY < 310)      posY = 0;
    else if (mouseY < 410) posY = 1;
    else                  posY = 2;

    if (tablero[posX][posY] == 0) {
      tablero[posX][posY] = playerTurn ? (byte)1 : (byte)-1;
      playerTurn = !playerTurn;
    }
  }
}

byte checkWinner() {
  //Diagonals
  if ( (tablero[0][0] == tablero[1][1] && tablero[1][1] == tablero[2][2])   //Diagonal \
    || (tablero[0][2] == tablero[1][1] && tablero[1][1] == tablero[2][0]) ) //Diagonal /
  {
    return tablero[1][1];
  }

  //Horitzontal i vertical
  for (int i = 0; i < tablero.length; i++) {
    if ( (tablero[i][0] == tablero[i][1] && tablero[i][1] == tablero[i][2])   //Horitzontal
      || (tablero[0][i] == tablero[1][i] && tablero[1][i] == tablero[2][i]) ) //Vertical
    {
      return tablero[i][i];
    }
  }

  return 0;
}


void ComprobacionGanador() {
  if (checkWinner() != 0) {
    DibuixaTaulell();
    gameState =2;
  }
}
