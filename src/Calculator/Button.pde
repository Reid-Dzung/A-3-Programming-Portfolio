class Button {
  // Membaer Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  // Constructer
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(random(0),random(150, 255),random(0));
    c2 = color(random(0),random(0),random(75,150));
    on = false;
  }

  void display() {
    if (on== true) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(0);
    textAlign(CENTER);
    textSize(50);
    if (val == 'S') {
      text("x²", x, y+15);
    } else {
      text(val, x, y + 15);
  }
}


void hover(int mx, int my) {
  on = (mx > x-w/2  && mx < x+w/2 && my > y-h/2 && my < y+h/2);
}
}
