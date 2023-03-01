class Ship {
  int x, y, w, ammo, turretCount, health;
  PImage ship;

  // Constructor
  Ship() {
    x=0;
    y=0;
    w=90;
    ammo = 100000;
    health = 100;
    turretCount = 1;
    ship = loadImage("ship.png");
  }

  void display() {
    image(ship, x, y);
    imageMode(CENTER);
    ship.resize(90, 90);
    image(ship, x, y);
    //fill(200);
    //ellipse(x, y-30, 20, 20);
    //fill(#515355);
    //rectMode(CENTER);
    //rect(x, y, 20, 60);
    //fill(#515355);
    //quad(x-10, y, x-20, y+10, x-20, y+20, x-10, y+10);
    //quad(x-20, y+10, x-50, y, x-50, y+10, x-20, y+20);
    //quad(x+10, y, x+20, y+10, x+20, y+20, x+10, y+10);
    //quad(x+20, y+10, x+50, y, x+50, y+10, x+20, y+20);
    //quad(x-10, y+30, x-20, y+40, x+20, y+40, x+10, y+30);
    //stroke(127);
    //line(x-50, y, x-50, y-10);
    //line(x+50, y, x+50, y-10);
    //fill(#DB530F);
    //triangle(x-10, y+40, x-15, y+50, x-20, y+40);
    //triangle(x, y+40, x-5, y+50, x-10, y+40);
    //triangle(x+10, y+40, x+5, y+50, x, y+40);
    //triangle(x+20, y+40, x+15, y+50, x+10, y+40);
    //fill(255);
  }

  void move(int tempx, int tempy) {
    x= tempx;
    y= tempy;
  }

  boolean fire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<80) {
      return true;
    } else {
      return false;
    }
  }
   
  boolean intersectSup(Supplies sup) {
    float d = dist(x, y, sup.x, sup.y);
    if (d<80) {
      return true;
    } else {
      return false;
    }
  }


  boolean isLeft, isRight, isUp, isDown;

  boolean setMove(int k1, boolean keyActive) {
    switch (k1) {
    case + 'W':
    case UP:
      return isUp = keyActive;

    case + 'A':
    case LEFT:
      return isLeft = keyActive;

    case + 'D':
    case RIGHT:
      return isRight = keyActive;

    case + 'S':
    case DOWN:
      return isDown = keyActive;

    default:
      return keyActive;
    }
  }

  void move() {
    int r = 90 >> 1;
    x = constrain(x+5*(int(isRight) - int(isLeft)), r, width -r);
    y = constrain(y+5*(int(isDown) - int(isUp)), r, width -r);
  }
}
