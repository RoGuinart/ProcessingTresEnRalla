
static byte[][] tablero = new byte[3][3];
static boolean playerTurn = false;
static boolean dragging = false;
static byte gameState = 1; //0 = menu, 1 = 1v1, 2 = 1v1 end, -1 = mann vs machine, -2 = mvm end
static boolean contraLaMaquina = false;
byte ganador;


void setup() {
  size(1280, 720);
  
  rect(490,210,300,300);
  line(590,510,590,210);// linea vertical 1
  line(690,510,690,210);// linea vertical 2
  line(790,410,490,410);// linea horizontal 1
  line(790,310,490,310);// linea horizontal 2
}

  
void draw() {
  //fondo();
  
  if(gameState == 1) {
    TresEnRalla(); //LogicaJuego  
  } else {
    fill(255,0,0);
    ellipse(mouseX,mouseY,10,10);
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
  
  if(gameState == 1 || gameState == -1) {
    DibujaFicha(); //LogicaJuego
    ComprobacionGanador(); //LogicaJuego
  }

}
