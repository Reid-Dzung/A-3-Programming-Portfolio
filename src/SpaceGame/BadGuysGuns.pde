class BadGuysGuns {
  int x, y, w, h, speed;

  BadGuysGuns(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 5;
    w = 10;
    h = 10;
  }

  void display() {
    fill(0);
    rectMode(CENTER);
    noStroke();
    rect(x, y, w, h);
  }

  void move() {
    x -= speed;
  }

  boolean reachedLeft() {
    if (x<+75) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Ship ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
