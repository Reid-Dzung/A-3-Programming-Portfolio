class Supplies {
  int x, y, diam, speed;
  PImage sup;

  Supplies() {
    x= width+50 ;
    y= int(random(height));
    diam= int(random(90, 90));
    speed= int(random(2, 6));
    sup = loadImage("Sups.png");
  }

  void display() {
    sup.resize(diam, diam);
    imageMode(CENTER);
    image(sup, x, y);
  }

  void move() {
    x = x-speed;
  }

  boolean reachedLeftSide() {
    if (x<-100) {
      return true;
    } else {
      return false;
    }
  }
}
