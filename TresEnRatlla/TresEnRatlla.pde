static byte[][] tablero = new byte[3][3];
static boolean playerTurn = false;

void setup() {
  size(1280, 720);
  PImage fons;
  fons = loadImage("../img/fons.jpg");
  image(fons,0,0);
  rect(490,210,300,300);
  fill(255,64,0);// solo es una prueba de color *cambiar
  line(590,510,590,210);// linea vertical 1
  line(690,510,690,210);// linea vertical 2
  line(790,410,490,410);// linea horizontal 1
  line(790,310,490,310);// linea horizontal 2
}

void draw() {
  for(int i = 0; i < tablero.length; i++) {
    for(int j = 0; j < tablero[i].length; j++) {
      drawTablet(490 + 100*i, 210 + 100*j, tablero[i][j]);
    }
  }
}

void mousePressed() {
   /*
     +---+---+---+
     |490|590|690|
     |210|210|210|
     +---+---+---+
     |490|590|690|
     |310|310|310|
     +---+---+---+
     |490|590|690|
     |410|410|410|
     +---+---+---+
     
     Todo es 100x100
   */
   
   int posX, posY;
   
  if(mouseX > 490 && mouseX < 790 
  && mouseY > 210 && mouseY < 510) {
      if(mouseX < 590)      posX = 0;
      else if(mouseX < 690) posX = 1;
      else                  posX = 2;
      
      if(mouseY < 310)      posY = 0;
      else if(mouseY < 410) posY = 1;
      else                  posY = 2;
      
      tablero[posX][posY] = playerTurn ? (byte)1 : (byte)-1;
      playerTurn = !playerTurn;
  }
}

void drawTablet(int x, int y, byte turn) {
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
