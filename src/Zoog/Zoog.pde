// Reid Nguyen | 9 sept 2022 |Zoog

void setup() {
  size(1000,1000);
}

void draw() {
// background(20,80,22);
  ellipseMode(CENTER);
  rectMode(CENTER);
 zoog(mouseX,mouseY);
// zoog(random(width),random(height));
}

void zoog(float x, float y) {
  //Draw Zoog's Body
  stroke(0);
  fill(100,20,22);
  rect(x,y,20,100);
  
  //draw Zoog's Head
  stroke(0);
  fill(200,200,20);
  ellipse(x,y-30,60,60);
  
  //Draw zoog's hat
  fill(20,255,22);
  triangle(x-30,y-50,x+30,y-50,x, y-100);
  
  //Draw Zoog's Eyes
  fill(255);
  ellipse(x-19,y-30,16,32);
  ellipse(x+19,y-30,16,31);
  
  //Draw Zoog's pupils
  fill(0);
  ellipse(x-19,y-30,8,16);
  ellipse(x+19,y-30,8,16);
  
  // Draw Zoog's Legs
  stroke(0);
  line(x-10,y+50,x-20,y+60);
  line(x+10,y+50,x+20,y+60);
}

//Draw Zoog's arms
