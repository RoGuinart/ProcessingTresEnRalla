void TresEnRallaDosJugadores() {
  DibuixaTaulell();

  if (EspaciosLibres() <= 1) {
    ganador = checkWinner();
    if(ganador == 0) {
      NoEspaisCanvi();
      ganador = checkWinner();
    }
    changeState(2);
  }
}

//Torna els espais lliures que queden al taulell.
byte EspaciosLibres() {
  byte espaciosLibres = 0;
  for (int i = 0; i < tablero.length; i++) {
    for (int j = 0; j < tablero[i].length; j++) {
      if (tablero[i][j] == 0) espaciosLibres++;
    }
  }
  return espaciosLibres;
}




//Quan els dos jugadors han posat quatre fitxesi no hi ha guanyador, es posa l'última fitxa automàticament.
void NoEspaisCanvi() {
  for (int i = 0; i < tablero.length; i++) {
    for (int j = 0; j < tablero[i].length; j++) {
      if(tablero[i][j] == 0) {
        tablero[i][j] = playerTurn ? (byte)1 : (byte)-1;
      }
    }
  }
}

//Comprova si hi ha algun guanyador.
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
    if (((tablero[i][0] == tablero[i][1] && tablero[i][1] == tablero[i][2])   //Horitzontal
      || (tablero[0][i] == tablero[1][i] && tablero[1][i] == tablero[2][i]))  //Verical
      &&  tablero[i][i] != 0)
    {
      return tablero[i][i];
    }
  }
  return 0;
}

//A l'afegir qualsevol fitxa al taulell, comprova si hi ha algun guanyador.
void ComprobacionGanador() {
  ganador = checkWinner();
  if (ganador != 0) {
    DibuixaTaulell();
    changeState(2);
  }
}
