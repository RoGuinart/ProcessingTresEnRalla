void setup(){
  size(1280, 720);
  PImage fons;
  fons = loadImage("../../fons.jpg");
  image(fons,0,0);
}

void draw(){
  fill(255);
  rect(150, 300, 400, 100, 25);
  rect(750, 300, 400, 100, 25);
  
  fill(0);
  textSize(50);
  text("Jugar un altre cop", 165,370);
  
  text("Sortir al menú", 790, 370);
}
