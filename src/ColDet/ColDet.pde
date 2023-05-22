// Reid Nguyen | Aug 31 2022 | ColDet
// Setup runs one time at startup
int xspeed, yspeed;
int xpos, ypos, wdth, ht;
void setup(){
   size(1000, 1000);
   background(0, 175, 0);
   xspeed = 3;
   yspeed = 10;
   wdth = 20;
   ht =20;
   noStroke();
   xpos = width/2;
   ypos = height/2;
   frameRate(60);
}
// Draw runs an a loop
void draw(){
   background(255);
   fill(0);
   ellipse(xpos, ypos, wdth, ht);
  
   xpos += xspeed;
   ypos += yspeed;
   if (xpos >= width-wdth/2 || xpos <= wdth/2){
     xspeed *= -1;
   }
     if (ypos >= height-ht/2 || ypos <= ht/2){
     yspeed = yspeed * -1;
   }
}
