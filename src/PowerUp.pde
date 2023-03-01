class PowerUp {
  int x, y, diam, speed;
  char type;
  PImage PowerUp;

  PowerUp() {
    x= width+50 ;
    y= int(random(height));
    diam= int(random(40, 40));
    speed= int(random(2, 6));
    // rock = loadImage("Ship2.png");
    int rand = int(random(3));
    if (rand == 0) {
      type = 'B';
    } else if (rand == 1) {
      type = 'T';
    } else {
      type = 'H';
    }
  }

  void display() {
    fill(0);
    ellipse(x, y-10, diam, diam);
    fill(250);
    textAlign (CENTER);
    text(type, x, y);
    //rock.resize(diam, diam);
    //imageMode(CENTER);
    //image(rock, x, y);
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
  boolean intersect(Ship ship) {
    float d = dist (x, y, ship.x, ship.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
