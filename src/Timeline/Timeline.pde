// Reid Nguyen | 12 Sept 2022 | TimeLine

void setup() {
  size(900, 400);
  background(200);
}

void draw() {
  background(200);
  
  //Render the Title
  textSize(30);
  textAlign(CENTER);
  fill(0);
  text("Computer History Timeline", width/2, 60);
  textSize(20);
  text("By Reid Nguyen", width/2, 90);

  //Render the timeline
  strokeWeight(3);
  line(100, 250, 800, 250);
  text("1940", 80, 240);
  text("1970", 820, 240);

  //Render timeline events
  histEvent(100, 200, "Z2 1940", " It was created by a German Engineer named Konrad Zuse \n It replaced the arithmetic and control logic with electrical relay circuits", true);
  histEvent(300, 200, "Z3 1941", "It was created by a German Engineer naned Konrad Zuse \n It was the first programmable computer", true);
  histEvent(500, 200,  "Computer 5", "details for computer 5",true);
  histEvent(700, 200, "Computer 7", "details for computer 7", true);
  histEvent(150, 300, "Bombes 1940", "It was created by some British cryptologists \n to help dicipher German Enigma-machine secret messages", false);
  histEvent(350,300, "Computer 4", "details for computer 4", false);
  histEvent(550,300, "Computer 6", "details for computer 6", false);
  histEvent(750,300, "Computer 8", "details for computer 8", false);
}

void histEvent(int x, int y, String title, String detail,boolean top) {
  if(top == true) {
      line(x, y, x+30, y+50);
  } else {
     line(x, y, x+30, y-50);
  }
  rectMode(CENTER);
  fill(77);
  strokeWeight(2);
  rect(x, y, 150, 30, 8);
  fill(255);
  textSize(15);
  text(title, x, y+5);
  if(mouseX > x-75 && mouseX < x+75 && mouseY > y-15 && mouseY < y+15) {
    fill(0);
    text(detail,width/2,350);
  }
}
