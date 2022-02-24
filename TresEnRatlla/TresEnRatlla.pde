static byte[][] tablero = new byte[3][3];
static byte[][] posicionFichas = new byte[2][4]; //0 = al costat del taulell, 1 = dragging, 2 = al taulell.
static boolean playerTurn = false; //Contra la màquina, false = màquina, true = jugador.
static boolean dragging = false;
static byte gameState; //0 = menu principal, 1 = 1v1, 2 = joc acabat, -1 = contra la màquina, -2 = contra la màquina menú
static byte previousState;
static byte ganador;


void setup() {
  size(1280, 720);
  changeState(0);
}


void draw() {
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
    case -2:
      changeState(1);
      break;
    default:
      print("Error", 500, 500, 100);
  }

  if(dragging) drag();
}

void mousePressed() {

  if(abs(gameState) == 1) {
    checkDrag(); //Dragging
    DibuixaTaulell(); //EntornGrafic
    ComprobacionGanador(); //LogicaJuego
  }

}

//Canvia l'estat del joc.
void changeState(int newState) {
  fondo();
  previousState = gameState; //Com que utilitzem el mateix menú de final de joc, necessitem això per diferenciar entre dos jugadors i joc contra la màquina.
  if(abs(newState) == 1) {
    if(newState == 1) {
      playerTurn = false;
    }
    
    //Reiniciem el taulell i les fitxes
    tablero = new byte[3][3];
    posicionFichas = new byte[2][4];
  }
  gameState = (byte)newState;
}
