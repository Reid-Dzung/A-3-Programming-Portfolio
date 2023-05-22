//// Reid Nguyen | 3 October 2022 | Temp Converter

//void setup() {
//  size(400,400);
//}

//void draw() {
// background(128);
// line(0,100,width, 400);
// for(int i=0; i<width; i+=20){
// line(i,95,i,105);
// textSize(9);
// textAlign(CENTER);
// text(i,i,90);
// }
//  noLoop();
//}

//float farToCel(float val) {
//  val = (val-32)*5.0/9.0 ;
//  return val;
//}

//float celToFar(float val) {
//  val = val*1.8+32;
//  return val;
//}

void setup() {
  size(200, 500);
}

void draw() {
  background(128);
  line(100, 0, 100, height);
  for (int i=height; i>0; i-=20) {
    line(95, i, 105, i);
    textSize(9);
    textAlign(CENTER);
    text(i, 90, i+2.5);
  }
  ellipse(100, mouseY, 5, 5);
  text(mouseY, 115, mouseY);
  
  text("Cel:" + farToCel(mouseY),150 ,height/2);
}

float farToCel(float val) {
  val = (val-32)*5.0/9.0;
  return val;
}

float celToFar(float val) {
  val = val*1.8+32;
  return val;
}
