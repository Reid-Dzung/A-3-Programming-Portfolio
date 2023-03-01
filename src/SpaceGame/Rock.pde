class Rock {
  int x, y, diam, speed;
  PImage rock;

  Rock() {
    x= width+50 ;
    y= int(random(height));
    diam= int(random(90, 90));
    speed= int(random(4, 10));
    rock = loadImage("Ship2.png");
  }

  void display() {
    rock.resize(diam, diam);
    imageMode(CENTER);
    image(rock, x, y);
  }

  void move() {
    x = x-speed;
  }

  boolean reachedLeftSide() {
    if (x<100) {
      return true;
    } else {
      return false;
    }
  }
}
