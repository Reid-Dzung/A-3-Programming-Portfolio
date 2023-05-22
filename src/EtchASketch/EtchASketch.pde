// Reid Nguyen | October 3 2022 | EtchASketch
int x,y;

void setup() {
  size(500,500);
  x= 250;
  y= 25;
  background(127);
}

void draw() {
  stroke(0);
  strokeWeight(3);
  if(keyPressed) {
    if(key =='w' || key == 'W'){
      moveUp(1);
    } else if(key =='s'  || key == 'S'){
      moveDown(1);
      }else if(key =='d'  || key == 'D'){
      moveRight(1);
      }else if(key =='a'  || key == 'A'){
      moveLeft(1);
      }
  }
}

void keyPressed() {
  if(key == CODED) {
    if(keyCode == UP) {
      moveUp(5);
    } else if (keyCode == DOWN) {
      moveDown (5);
    } else if (keyCode == LEFT) {
      moveLeft (5);
    } else if (keyCode == RIGHT) {
      moveRight (5);
    }
  }
}

void mousePressed() {
  saveFrame("image-#####.png");
}

void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x+=(rep);
}

void moveDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i);
  }
  y+=(rep);
}

void moveLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y);
  }
  x-=(rep);
}

void moveUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-i);
  }
  y-=(rep);
}

void moveDownRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y+i);
  }
  x+=(rep);
  y+=(rep);
}

void moveUpLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y-i);
  }
  x-=(rep);
  y-=(rep);
}
