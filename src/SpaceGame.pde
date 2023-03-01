// Reid Nguyen | 28 Nov 2022 | SpaceGame
import processing.sound.*;
Ship s1;
SoundFile blaster;
Timer rockTimer;
Timer CannonBallTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> pu = new ArrayList<PowerUp>();
Timer PowerUpTimer;
//ArrayList<Supplies> sup = new ArrayList<Supplies>();
//Timer supTimer;
Waves[] waves = new Waves[20];
ArrayList<CannonBall> cannonballs = new ArrayList<CannonBall>();
ArrayList<BadGuys> guys = new ArrayList<BadGuys>();
Timer BadGuysTimer;
ArrayList<BadGuysGuns> guns = new ArrayList<BadGuysGuns>();
Timer BadGuysGunsTimer;
int score, level, rockCount, CannonBallCount, BaseHealth;
boolean play;
PImage Base;

void setup() {
  //size(displayWidth, displayHeight);
  size(1500, 800);
  blaster = new SoundFile(this, "blaster.wav");
  noCursor();
  BaseHealth = 1000;
  s1 = new Ship();
  rockTimer = new Timer(2000);
  rockTimer.start();
  PowerUpTimer = new Timer (10000);
  PowerUpTimer.start();
  BadGuysGunsTimer = new Timer(1000);
  BadGuysGunsTimer.start();
  BadGuysTimer = new Timer(10000);
  BadGuysTimer.start();
  // supTimer = new Timer(2500);
  //supTimer.start();
  CannonBallTimer = new Timer(500);
  CannonBallTimer.start();
  for (int i=0; i<waves.length; i++) {
    waves[i] = new Waves();
  }
  score = 0;
  level = 1;
  rockCount = 0;
  CannonBallCount = 0 ;
  play = false ;
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0, 0, 200);
    noCursor();
    Base = loadImage("Base.png");

    // render in Waves
    for (int i=0; i<waves.length; i++) {
      waves[i].display();
      waves[i].move();
    }
    imageMode(CENTER);
    Base.resize(1250, height+350);
    image(Base, 100, 475);
    //render info pannel
    InfoPanel();
    noCursor();



    if (BadGuysTimer.isFinished()) {
      guys.add(new BadGuys());
      BadGuysTimer.start();
    }


    //for (int i = 0; i < guys.size(); i++) {
    //  BadGuys g = guys.get(i);
    //  if (g.reachedBottom()) {
    //    guys.remove(g);
    //    BaseHealth -= 50;
    //    println(guys.size());
    //  } else {
    //    g.display();
    //    g .move();
    //  }
    //}

    //if (BadGuysGunsTimer.isFinished()) {
    //  for (int i = 0; i < guns.size(); i++) {
    //    BadGuysGuns g = guns.get(i);
    //    guns.add(new BadGuysGuns(g.x, g.y));
    //    blaster.stop();
    //    blaster.play();
    //    BadGuysGunsTimer.start();
    //  }
    //}

    //for (int i = 0; i < guns.size(); i++) {
    //  BadGuysGuns g = guns.get(i);
    //  if (g.reachedLeft()) {
    //    guns.remove(g);
    //  } else {
    //    g.display();
    //    g.move(g.x,g.y);
    //  }
    //}
 for (int i = 0;i < guys.size(); i++) {
   BadGuys g = guys.get(i);
   if (g.reachedBottom()) {
     guys.remove(g);
   } else {
     g.display();
     g.move();
     if (BadGuysGunsTimer.isFinished()) {
       guns.add(new BadGuysGuns(g.x,g.y));
       BadGuysGunsTimer.start();
     }
   }
 } 
 
 for (int i = 0; i < guns.size(); i++) {
      BadGuysGuns v = guns.get(i);
      if (v.reachedLeft()) {
        guns.remove(v);
      } else {
        v.display();
        v.move();
        if (v.intersect(s1)){
          s1.health-=50;
          guns.remove(v);
        }
      }
    }
 



    //distribution PowerUps
    if (PowerUpTimer.isFinished()) {
      pu.add(new PowerUp());
      PowerUpTimer.start();
    }

    // render PowerUps
    for (int i = 0; i < pu.size(); i++) {
      PowerUp p = pu.get(i);
      if (p.intersect(s1)) {
        if (p.type == 'H') {
          s1.health += 50;
        } else if (p.type == 'B') {
          BaseHealth += 100;
        } else {
          s1.turretCount ++;
        }
        pu.remove(p);
      }
      if (p.reachedLeftSide()) {
        pu.remove(p);
        BaseHealth -= 50;
        println(pu.size());
      } else {
        p.display();
        p .move();
      }
    }

    //distribution rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      rockCount ++;
    }


    // render Rock
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health -= 50;
        score += 50;
        // todo; add sound,animaion,visualeffects
        rocks.remove(i);
      }
      if (r.reachedLeftSide()) {
        rocks.remove(r);
        BaseHealth -= 50;
        println(rocks.size());
      } else {
        r.display();
        r.move();
      }
    }
    // render supplies
    // for (int i = 0; i < sup.size(); i++) {
    //  Supplies s = sup.get(i);
    //  if(s1.intersectSup(s)) {
    //    // todo; add sound,animaion,visualeffects
    //    sup.remove(i);
    //  }
    //  if (s.reachedLeftSide()) {
    //    sup.remove(s);
    //    println(rocks.size());
    //  } else {
    //    s.display();
    //    s.move();
    //  }
    //}


    //r1.display();
    //r1.move();



    for (int i = 0; i < cannonballs.size(); i++) {
      CannonBall c = cannonballs.get(i);
      for (int t = 0; t < rocks.size(); t++) {
        Rock r = rocks.get(t);
        if (c.intersect(r)) {
          score+= 50;
          cannonballs.remove(i);
          rocks.remove(t);
        }
      }
      if (c.reachedRight()) {
        cannonballs.remove(c);
        // s1.health -= 50;
        println(rocks.size());
      } else {
        c.display();
        c.move();
      }
    }

    //    c1.display();
    //    c1.move();

    // Lazer add
    if (mousePressed) {
      if (CannonBallTimer.isFinished()) {
        cannonballs.add(new CannonBall(s1.x, s1.y));
        blaster.stop();
        blaster.play();
        CannonBallTimer.start();
      }
    }
    if (keyPressed && key == ' ') {
      if (CannonBallTimer.isFinished()) {
        cannonballs.add(new CannonBall(s1.x, s1.y));
        blaster.stop();
        blaster.play();
        CannonBallTimer.start();
      }
    }
    // render ship
    s1.display();
    s1.move();

    if (s1.health<1 || BaseHealth<1) {
      gameOver();
    }
  }
}


void InfoPanel() {
  fill(128, 127);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textSize(30);
  text("Score:"+ score, 25, 35);
  text("Health:"+ s1.health, 200, 35);
  text("Turrets:" + s1.turretCount, 400, 35);
  text("BaseHealth:"+BaseHealth, 600, 35);
}

//void mousePressed() {
//  blaster.stop();
//  blaster.play();
//  if (s1.fire() && s1.turretCount == 1) {
//    cannonballs.add(new CannonBall(s1.x, s1.y));
//  }
//  if (s1.fire() && s1.turretCount == 2) {
//    cannonballs.add(new CannonBall(s1.x, s1.y-10));
//    cannonballs.add(new CannonBall(s1.x, s1.y+10));
//  }
//  if (s1.fire() && s1.turretCount == 3) {
//    cannonballs.add(new CannonBall(s1.x, s1.y-15));
//    cannonballs.add(new CannonBall(s1.x, s1.y));
//    cannonballs.add(new CannonBall(s1.x, s1.y+15));
//  }
//}


void keyPressed() {
  s1.setMove(keyCode, true);
  //  println(keyCode);
  //  if (key == ' ') {
  //    if (s1.fire() && s1.turretCount == 1) {
  //      cannonballs.add(new CannonBall(s1.x, s1.y));
  //    }
  //    if (s1.fire() && s1.turretCount == 2) {
  //      cannonballs.add(new CannonBall(s1.x, s1.y-10));
  //      cannonballs.add(new CannonBall(s1.x, s1.y+10));
  //    }
  //    if (s1.fire() && s1.turretCount == 3) {
  //      cannonballs.add(new CannonBall(s1.x, s1.y-15));
  //      cannonballs.add(new CannonBall(s1.x, s1.y));
  //      cannonballs.add(new CannonBall(s1.x, s1.y+15));
  //    }
  //  }
}

void keyReleased() {
  s1.setMove(keyCode, false);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Click or press any key to start...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("GameOver", width/2, height/2);
  play = false;
  noLoop();
}

//void display () {
//     Base.resize(1000, displayHeight);
//    imageMode(CENTER);
//    image(Base, 1000, 0);
//}
