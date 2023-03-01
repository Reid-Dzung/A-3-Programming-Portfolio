class Waves {
  int x, y, diam, speed;
  PImage wave;

  Waves () {
    x = int(random(width));
    y = int(random(height));
    diam = 100;
    speed = 2;
    wave = loadImage("Waves.png");
  }

  void display() {
    wave.resize(diam, diam);
    imageMode(CENTER);
    image(wave, x, y);
  }

  void move() {
    if (x>width+5) {
      x = 5;
    } else {
      x+= speed;
    }
  }

  boolean reachBottom() {
    return true;
  }
}
