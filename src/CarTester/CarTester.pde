// Reid Nguyen || 24 Oct 2022 || Cars App
Car c1,c2;
//Car[] cars = new Car[10];

void setup() {
  size(3000, 500);
  c1 = new Car();
  c2 = new Car();
//  for (int i=0; i<cars.length; i++){
//    cars[i] = new Car();
 // }
}


void draw() {
  background(127);
  c1.display();
  c1.drive();
  c2.display();
  c2.drive();
//   for (int i=0; i<cars.length; i++){
 //   cars[i].display();
  //  cars[i].drive();
 // }
}
