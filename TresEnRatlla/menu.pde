void menuPrincipal() {

  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(50);

  //Títol
  int boxX = 1280/2, //Centro del cuadrado coordenada X
      boxY = 75,     //Centro del cuadrado coordenada Y
      boxW = 500,    //Longitud del cuadrado
      boxH = 100;    //Altura del cuadrado
  int colour = 255;  //Color de la caja - si se pasa por encima con el ratón, será gris (200). Si no, blanco (255). El título es excepción.
  fill(colour);
  rect(boxX, boxY, boxW, boxH, 10); //Títol
  //Text
  fill(0);
  text("Tres en ratlla", boxX, boxY, boxW, boxH);


  //Màquina
  boxX = 1280/2-1280/6; boxY = 300; boxW = 300; boxH = 200;
  colour = (mouseX > boxX - boxW/2 && mouseX < boxX + boxW/2) && (mouseY > boxY - boxH/2 && mouseY < boxY + boxH/2) ? 200 : 255;
  fill(colour);
  rect(boxX, boxY, boxW, boxH, 10); //Màquina
  //Text
  fill(0);
  text("Jugar contra la màquina", boxX, boxY, boxW, boxH);
  if(colour == 200 && mousePressed) {
    changeState(-2);
    return;
  }

  //1v1
  boxX = 1280/2+1280/6; boxY = 300; boxW = 300; boxH = 200;
  colour = (mouseX > boxX - boxW/2 && mouseX < boxX + boxW/2) && (mouseY > boxY - boxH/2 && mouseY < boxY + boxH/2) ? 200 : 255;
  fill(colour);
  rect(boxX, boxY, boxW, boxH, 10); //1v1
  //Text
  fill(0);
  text("Dos\n jugadors", boxX, boxY, boxW, boxH);
  if(colour == 200 && mousePressed) {
    changeState(1);
    return;
  }

  //Box
  boxX = 1280/2; boxY = 600; boxW = 250; boxH = 150;
  colour = (mouseX > boxX - boxW/2 && mouseX < boxX + boxW/2) && (mouseY > boxY - boxH/2 && mouseY < boxY + boxH/2) ? 200 : 255;
  fill(colour);
  rect(boxX, boxY, boxW, boxH, 10); //Sortir
  //Text
  fill(0);
  text("Sortir", boxX, boxY, boxW, boxH);
  if(colour == 200 && mousePressed) {
    exit();
  }

}

void menuFinalJoc() {
  
  DibuixaTaulell();
  
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(50);

  if(ganador != 0) {
    String winnerString = ganador == -1 ? "azul" : "rojo";
    text("El ganador es " + winnerString +"!", 1280/2, 150);
  } else {
    text("Heu empatat!", 1280/2, 150);
  }


  int boxX = 1280/6, boxY = 300, boxW = 300, boxH = 200;
  int colour = (mouseX > boxX - boxW/2 && mouseX < boxX + boxW/2) && (mouseY > boxY - boxH/2 && mouseY < boxY + boxH/2) ? 200 : 255;
  fill(colour);
  rect(boxX, boxY, boxW, boxH, 10); //Jugar otra vez
  //Text
  fill(0);
  text("Jugar de nou", boxX, boxY, boxW, boxH);
  if(colour == 200 && mousePressed) {
    changeState(previousState);
    return;
  }

  boxX = 5*1280/6; boxY = 300; boxW = 300; boxH = 200;
  colour = (mouseX > boxX - boxW/2 && mouseX < boxX + boxW/2) && (mouseY > boxY - boxH/2 && mouseY < boxY + boxH/2) ? 200 : 255;
  fill(colour);
  rect(boxX, boxY, boxW, boxH, 10); //Salir
  //Text
  fill(0);
  text("Sortir al menú", boxX, boxY, boxW, boxH);
  if(colour == 200 && mousePressed) {
    changeState(0);
  }
}

void Taulell() {
    rect(490,210,300,300);
    line(590,510,590,210);  // linea vertical 1
    line(690,510,690,210);  // linea vertical 2
    line(790,410,490,410);  // linea horizontal 1
    line(790,310,490,310);  // linea horizontal 2
}
