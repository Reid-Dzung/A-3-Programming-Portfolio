//Reid Nguyen | October 5 2023 | Age

void setup(){
  size(300, 600);
}

void draw(){
  background(127);
  line(75,0,75, height);
  for(int i=height; i>0; i-=20){
    line(70, i, 80, i);
    textSize(9);
    textAlign(CENTER);
    text(i, 90, i);
  }
  ellipse(75,mouseY, 5, 5);
  text(mouseY, 115, mouseY);
  
  text("Move your mouse Up and Down \n to move the dot ont the line. \n Move the dot to the number of your age in years \n then it will tell you how long you have lived in hours", 200, 150 );
  
  text("Hour's alive " + yearToHr(mouseY), 200,height/2);
  text("Year's alive " + mouseY, 200, 275);
  textSize(15);
  text("Reid Nguyen", 200, 50);
  textSize(20);
  text("Year's to Hours", 200, 25);
}


float yearToHr(float val) {
  val = (val*365.25)*24;
  return val;
}
