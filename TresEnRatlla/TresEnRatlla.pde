
static byte[][] tablero = new byte[3][3];
static boolean playerTurn = false; //Contra la màquina, false = màquina, true = jugador.
static boolean dragging = false;
static byte gameState = 0; //0 = menu principal, 1 = 1v1, 2 = joc acabat, -1 = contra la màquina, -2 = contra la màquina menú
byte ganador;


void setup() {
  size(1280, 720);

  fondo();


}

  
void draw() {
  //a
  switch(gameState) {
    case 0:
      menuPrincipal();
      break;
    case 1:

      TresEnRallaDosJugadores();
      break;
    case 2:
      menuFinalJoc();
      break;
    default:
      print("Error", 500, 500, 100);
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
  
  if(abs(gameState) == 1) {
    DibujaFicha(); //LogicaJuego
    DibuixaTaulell(); //EntornGrafic
    ComprobacionGanador(); //LogicaJuego
  }

}
