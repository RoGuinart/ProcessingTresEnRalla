byte dragI, dragJ;

void drag() {
  fondo();
  Taulell();
  drawFichas();
  drawDrag();
  if(!mousePressed)  {
    dragging = false;
    draggingResult();
  }
    posicionFichas[dragI][dragJ] = 2;
}


void checkDrag() {
  for(byte i = 0; i < posicionFichas.length; i++) {
    for(byte j = 0; j < posicionFichas[i].length; j++) {
      dragging = (mouseX > (1+i)*1280/3 - 50 && mouseX < (1+i)*1280/3 + 50) && (mouseY > 200+100*j - 50 && mouseY < 200+100*j + 50);
      if(dragging) {
        dragI = i;
        dragJ = j;
        posicionFichas[i][j] = 1;
      }
    }
  }
  
}

void draggingResult() {
  
  if(mouseX >= 500 && mouseX < 800 && mouseY >= 200 && mouseY < 500) {
    posicionFichas[dragI][dragJ] = 2;
    byte resultI=0, resultJ=0;
    for(byte i = 0; i < tablero.length; i++) {
      if(mouseX < 500 + (i+1)*100) resultI = i;
    }
  
    for(byte j = 0; j < tablero[0].length; j++) {
      if(mouseY < 200 + (j+1)*100) resultJ = j;
    }
    int torn = dragI == 0 ? -1 : 1;
    
    tablero[resultI][resultJ] = (byte)torn;
  } else {
    posicionFichas[dragI][dragJ] = 0;
  }
}

void drawFichas() {
  imageMode(CENTER);
  for (int i = 0; i < posicionFichas.length; i++) {
    for (int j = 0; j < posicionFichas[i].length; j++) {
      if(posicionFichas[i][j]==0){
      
        if(i == 0) {
          PImage ficha = loadImage("../img/ficha.png");
          image(ficha, 1280/3, 200+100*j);
        } else {
          fill(255, 0, 0);
          ellipse(2*1280/3, 200+100*j, 90, 90);
        }
      }
    }
  }
}

void drawDrag() {
  if(dragI == 0) {
    PImage ficha = loadImage("../img/ficha.png");
    image(ficha,mouseX, mouseY);
  } else {
    ellipse(mouseX, mouseY, 90, 90);
  }
}
