void DibuixaTaulell() {
  for (int i = 0; i < tablero.length; i++) {
    for (int j = 0; j < tablero[i].length; j++) {
      PintaQuadres(490 + 100*i, 210 + 100*j, tablero[i][j]);
    }
  }
}


void PintaQuadres(int x, int y, byte turn) {
  switch(turn) {
    case 1:
      fill(255,0,0);
      break;
    case -1:
      fill(0,0,255);
      break;
    default:
      fill(255,255,255);
  }
  rect(x, y, 100, 100);
}

void fondo() {
  PImage fons;
  fons = loadImage("../img/fons.jpg");
  image(fons,0,0);
}
