class Car {
  color c;
  float xpos, ypos, xspeed;
  

  // Constructer
  Car() {
    c = color (random(255), random(255), random(255));
    xpos=random(width);
    ypos=random(height);
    xspeed = random(-5 , 5);
  }
  void display() {
    rectMode(CENTER);
    fill(c);
    rect(xpos, ypos, 20, 10);
    fill(0);
    rect(xpos-6, ypos-6, 6, 3);
    rect(xpos+6, ypos+7, 6, 3);
    rect(xpos-6, ypos+7, 6, 3);
    rect(xpos+6, ypos-6, 6, 3);
    fill(250,250,0);
    triangle(xpos+10,ypos,xpos+30,ypos-10,xpos+30,ypos+10);
    fill(250);
    rect(xpos+5,ypos,5,10);
  }

  void drive() {
    xpos = xpos + xspeed;
    if (xpos>width) {
      xpos=0;
    } 
    if(xpos<0) {
      xpos = width;
    }
  }
}
