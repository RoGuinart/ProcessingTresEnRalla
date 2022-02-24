byte dragI, dragJ;

//Sempre s'executa quan s'arrossega.
void drag() {
  text("DRAGGING: " + mouseX + ", " + mouseY, 1280/2, 600);
  drawDrag();
  if(!mousePressed)  {
    draggingResult();
    dragging = false;
  }
}

//Comprova si agafem alguna fitxa per arrossegar.
void checkDrag() {
      int torn = playerTurn ? 0 : 1;
  for(byte i = 0; i < posicionFichas.length; i++) {
    
    if(torn == i) {
      for(byte j = 0; j < posicionFichas[i].length; j++) {
        boolean dragPiece = (mouseX > (1+i)*1280/3 - 50 && mouseX < (1+i)*1280/3 + 50) && (mouseY > 200+100*j - 50 && mouseY < 200+100*j + 50) && posicionFichas[i][j]==0;
        
          text("Dragging! "+dragI + ", " + dragJ, 1280/4, 600);
        if(dragPiece) {
          dragging = true;
          rectMode(CENTER);
          rect((1+i)*1280/3, 200+100*j, 100, 100);
          dragI = i;
          dragJ = j;
          
          posicionFichas[dragI][dragJ] = 1;
        }
      }
    }
  }
}

//A l'acabar d'arrossegar s'executa. Comprova si el lloc és vàlid.
void draggingResult() {
  
  if(mouseX >= 500 && mouseX < 800 && mouseY >= 200 && mouseY < 500) {
    byte resultI=0, resultJ=0;
    for(byte i = 0; i < tablero.length; i++) {
      if(mouseX < 500 + (i+1)*100)  {
        resultI = i;
        break;
      }
    }
  
    for(byte j = 0; j < tablero[0].length; j++) {
      if(mouseY < 200 + (j+1)*100) {
        resultJ = j;
        break;
      }
    }
    int torn = dragI == 0 ? 1 : -1;
    if(tablero[resultI][resultJ] == 0) {
      text("adwian", 3*1280/4, 600);
      tablero[resultI][resultJ] = (byte)torn;
      posicionFichas[dragI][dragJ] = 2; 
      playerTurn = !playerTurn;
    } else {
      posicionFichas[dragI][dragJ] = 0;
    }
    
  } else {
    posicionFichas[dragI][dragJ] = 0;
  }
}

//Pinta les fitxes al costat del taulell
void drawFichas() {
  imageMode(CENTER);
  for (int i = 0; i < posicionFichas.length; i++) {
    for (int j = 0; j < posicionFichas[i].length; j++) {
      if(posicionFichas[i][j]==0){
      
        if(i == 0) {
          PImage ficha = loadImage("../img/ficha.png");
          image(ficha, 1280/3, 200+100*j);
        } else {
          fill(255);
          ellipse(2*1280/3, 200+100*j, 90, 90);
        }
      }
    }  
  }
  
}

//Pinta la fitxa que s'està movent
void drawDrag() {
  if(dragI == 0) {
    PImage ficha = loadImage("../img/ficha.png");
    image(ficha,mouseX, mouseY);
  } else {
    fill(255);
    ellipse(mouseX, mouseY, 90, 90);
  }
}
