//Reid | September 19 | Prossesing shapes 

void setup() {
  size(650,550);
  background(127);
}
void draw() {
  background(127);
  for (int y = 100; y <= height; y += 100){
    line(0,y,width,y);
  }
  for (int x = 100; x <= width; x += 100){
    line(x,0,x,height);
  }
  fill(255,255,0);
  square(20,20,120);
  rect(180,20,120,120,10);
  rect(340,20,120,120,10,7,20,40);
  rect(500,40,120,80);
  fill(255,0,0);
  circle(80,240,120);
  ellipse(240,240,120,80);
  ellipse(400,240,80,120);
  fill(0,0,255);
  triangle(560,180,620,300,500,300);
  triangle(40,340,140,460,20,420);
  fill(0,255,255);
  quad(180,340,300,340,300,380,180,460);
  quad(400,340,440,400,400,460,360,400);
  quad(500,340,620,400,500,460,560,400);
  fill(250);
  textAlign(CENTER);
    for (int x = 100; x <= width; x += 100){
      text(x,x,11);
  }
    for (int y = 100; y <= height; y += 100){
      text(y,11,y+5);
  }
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(mouseX,mouseY,random(20,80),random(20,80));
}
