void DibuixaTaulell() {
  rectMode(CORNER);
  for (int i = 0; i < tablero.length; i++) {
    for (int j = 0; j < tablero[i].length; j++) {
      PintaQuadres(500 + 100*i, 200 + 100*j, tablero[i][j]);
    }
  }
  
    drawFichas();
  
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
  imageMode(CENTER);
  PImage fons;
  fons = loadImage("../img/fons.jpg");
  image(fons,1280/2,720/2);
}
