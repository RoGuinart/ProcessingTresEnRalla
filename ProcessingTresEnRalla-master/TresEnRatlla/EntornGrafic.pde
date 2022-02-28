void DibuixaTaulell() {
  Taulell();
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
      PImage ficha = loadImage("../img/ficha.png");
      image(ficha,x+50, y+50);
      break;
    case -1:
      fill(255);
      ellipse(x+50, y+50, 90, 90);
      break;
  }
}

//Dibuixa el fons.
void fondo() {
  /*
  imageMode(CENTER);
  PImage fons;
  fons = loadImage("../img/fons.jpg");
  image(fons,1280/2,720/2);
  */
  background(128);
}
