class CannonBall {
  int x, y, w, h, speed;

  CannonBall(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 10;
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
    x += speed;
  }

  boolean reachedRight() {
    if (x>width+100) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
