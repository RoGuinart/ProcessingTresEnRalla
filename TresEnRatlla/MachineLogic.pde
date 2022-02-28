byte machineState = 0; //0 = calculant, 1 = movent.
boolean machineTurn=false;
byte shitNumber = 0; //Número de fitxes mogudes.
byte machineI, machineJ;
float x, y;
int posicioX, posicioY; //Posició de la fitxa dins del taulell.

void TresEnRallaMaquina() {
  if(machineState == 0) {
    if(!machineCheck()) {
      int newPosition = (int)(Math.random()*EspaciosLibres());
      for(byte i = 0; i < tablero.length; i++) {
        for(byte j = 0; j < tablero[i].length; j++) {
          if(tablero[i][j] == 0 && newPosition-- == 0) {
            
            changeMachineState(i,j);
            return; //Sortim dels dos bucles
          }
        }
      }
    }
  } else if(machineState == 1) {
    lerpingtonVille();
  }
}

void lerpingtonVille() {
  

  
  x = lerp(x, posicioX, 0.05);
  y = lerp(y, posicioY, 0.05);
  
  if(x >= posicioX-2 && x <= posicioX+2 && y >= posicioY-2 && y <= posicioY+2) {
    byte fichaMaquina = playerTurn ? (byte)1 : (byte)-1; 
    tablero[machineI][machineJ] = fichaMaquina;
    posicionFichas[1][shitNumber++] = 2;
    ComprobacionGanador();
    machineState=0;
    playerTurn=!playerTurn;
  }
  

  fill(255,0,0);
  ellipse(x, y, 90, 90);
  
}

boolean machineCheck() {
  int spaceCounter;
  
  //Diagonal \
  spaceCounter = tablero[0][0] + tablero[1][1] + tablero[2][2];
  if(abs(spaceCounter) == 2) {
    if(tablero[0][0] == 0) {
      changeMachineState(0,0);
    } else if(tablero[1][1] == 0) {
      changeMachineState(1,1);
    } else {
      changeMachineState(2,2);
    }
    return true;
  }
  
  //Diagonal /
  spaceCounter = tablero[2][0] + tablero[1][1] + tablero[0][2];
  if(abs(spaceCounter) == 2) {
    if(tablero[2][0] == 0) {
      changeMachineState(2,0);
    } else if(tablero[1][1] == 0) {
      changeMachineState(1,1);
    } else {
      changeMachineState(0,2);
    }
    return true;
  }
  
  for(byte i = 0; i < tablero.length; i++) {
    
    //Vertical
    spaceCounter = tablero[i][0] + tablero[i][1] + tablero[i][2];
    if(abs(spaceCounter) == 2) {
      if(tablero[i][0] == 0) {
      changeMachineState(i,0);
    } else if(tablero[i][1] == 0) {
      changeMachineState(i,1);
    } else {
      changeMachineState(i,2);
    }
      return true;
    }
    
    //Horitzontal
    spaceCounter = tablero[0][i] + tablero[1][i] + tablero[2][i];
    if(abs(spaceCounter) == 2) {
      if(tablero[0][i] == 0) {
      changeMachineState(0,i);
    } else if(tablero[1][i] == 0) {
      changeMachineState(1,i);
    } else {
      changeMachineState(2,i);
    }
      return true;
    }
    
  }
  
  return false;
}

void changeMachineState(int i, int j) {
  //machineI i machineJ són 

  machineI = (byte)i;
  machineJ = (byte)j;

  //x i y són les posicions de la fitxa fora del taulell.
  x= 2*1280/3;
  y= 200+100*shitNumber;
  posicionFichas[1][shitNumber] = -1;
  for(byte m = 0; m < tablero.length; m++) {
    if(m == machineI)  {
      posicioX = 550 + m*100;
      break;
    }
  }

  for(byte n = 0; n < tablero[0].length; n++) {
    if(n == machineJ) {
      posicioY = 250 + n*100;
      break;
    }
  }

  machineState = 1;
}
