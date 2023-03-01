class BadGuys {
  int x, y, diam, speed;
  PImage BadGuys;

  BadGuys() {
    x= width-50 ;
    y= 0;
    diam= int(random(90, 90));
    speed= 4;
    BadGuys = loadImage("Ship2.png");
  }

  void display() {
    BadGuys.resize(diam, diam);
    imageMode(CENTER);
    image(BadGuys, x, y);
  }

  void move() {
    y = y+speed;
  }

  boolean reachedBottom() {
    if (y>height +100) {
      return true;
    } else {
      return false;
    }
  }
   boolean intersect(CannonBall balls) {
    float d = dist(x, y, balls.x, balls.y);
    if (d<80) {
      return true;
    } else {
      return false;
    }
  }
  void fire () {
    
  }
}
