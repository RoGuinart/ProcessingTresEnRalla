void setup(){
  size(1280, 720);
  PImage fons;
  fons = loadImage("../fons.jpg");
  image(fons,0,0);
}

void draw(){
  fill(255);
  rect(400, 100, 500, 100, 25);
  rect(50, 300, 600, 150, 25);
  rect(800, 300, 350, 150, 25);
  
  fill(0);
  textSize(50);
  text("Tres en ratlla", 500, 170);
 
  text("Jugar contra la màquina", 100, 390);
  
  text("Jugar 1 vs 1", 850,390);
}  
