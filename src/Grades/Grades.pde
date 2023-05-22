// Reid Nguyen | Spetember 19 | Grades
float val;

void setup() {
  size(1000, 200);
  val = 0.0;
}

void draw() {
  background(127);
  val = mouseX/250.0;
  noCursor();
  line(0, 100, width, 100);
  ellipse(mouseX, 100, 5, 5);
  for (int x = 0; x <= width; x += 100) {
    float textNum = 0.4 * (x/100);
    line(x, 95, x, 105);
    text(textNum, x, 90);
    for (int i=0; i<1000; i=i+=50) {
      line(i, 95, i, 105);
      text(i, i, 85);
    }
  }
  text(mouseX, mouseX, 90);
  text(val, mouseX, 115);
  text(calcGrade(val), width/2, 150);
  text("Letter Grade:" + calcGrade(val), width/2, 150);
}

String calcGrade(float grade) {
  String letterGrade = "";
  if (grade > 3.5) {
    letterGrade ="A";
  } else if (grade >= 3.0) {
    letterGrade = "A-";
  } else if (grade >= 2.84) {
    letterGrade = "B+";
  } else if (grade >= 2.67) {
    letterGrade = "B";
  } else if (grade >= 2.5) {
    letterGrade = "B-";
  } else if (grade >= 2.34) {
    letterGrade = "C+";
  } else if (grade >= 2.17) {
    letterGrade = "C";
  } else if (grade >= 2.0) {
    letterGrade = "C-";
  } else if (grade >= 1.66) {
    letterGrade = "D+";
  } else if (grade >= 1.33) {
    letterGrade = "D";
  } else if (grade >= 1.0) {
    letterGrade = "D-";
  } else {
    letterGrade = "F";
  }
  return letterGrade;
}



//if (grade > 3.5) {
//  letterGrade = "A.");
//} else if (grade >= 3.0) {
//  letterGrade = "A-.");
//} else if (grade >= 2.84) {
//  letterGrade = "B+.");
//} else if (grade >= 2.67) {
//  letterGrade = "B.");
//} else if (grade >= 2.5) {
//  letterGrade = "B-.");
//} else if (grade >= 2.34) {
//  letterGrade = "C+.");
//} else if (grade >= 2.17) {
//  letterGrade = "C.");
//} else if (grade >= 2.0) {
//  letterGrade = "C-.");
//} else if (grade >= 1.66) {
//  letterGrade = "D+.");
//} else if (grade >= 1.33) {
//  letterGrade = "D.");
//} else if (grade >= 1.0) {
//  letterGrade = "D-.");
//} else {
//  letterGrade = "F.");
//}
