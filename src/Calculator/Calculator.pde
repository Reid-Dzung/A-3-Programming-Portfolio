// Reid Nguyen | November 2022 | Calc Project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];
String dVal = "0.0";
boolean left = true;
float l, r, result;
char op = ' ';
color back = color(random(255), random(255), random(255));
color disp = color(random(150), random(150), random(150));

void setup() {
  size(380, 660);
  numButtons[0] = new Button(310, 310, 60, 60, '0');
  numButtons[1] = new Button(70, 210, 60, 60, '1');
  numButtons[2] = new Button(130, 210, 60, 60, '2');
  numButtons[3] = new Button(190, 210, 60, 60, '3');
  numButtons[4] = new Button(250, 210, 60, 60, '4');
  numButtons[5] = new Button(310, 210, 60, 60, '5');
  numButtons[6] = new Button(70, 310, 60, 60, '6');
  numButtons[7] = new Button(130, 310, 60, 60, '7');
  numButtons[8] = new Button(190, 310, 60, 60, '8');
  numButtons[9] = new Button(250, 310, 60, 60, '9');
  opButtons[0] = new Button(70, 410, 60, 60, '+');
  opButtons[1] = new Button(130, 410, 60, 60, '-');
  opButtons[2] = new Button(190, 410, 60, 60, 'x');
  opButtons[3] = new Button(250, 410, 60, 60, '÷');
  opButtons[4] = new Button(310, 410, 60, 60, '=');
  opButtons[5] = new Button(70, 510, 60, 60, '.');
  opButtons[6] = new Button(130, 510, 60, 60, 'C');
  opButtons[7] = new Button(190, 510, 60, 60, 'π');
  opButtons[8] = new Button(250, 510, 60, 60, 'S');
  opButtons[9] = new Button(310, 510, 60, 60, '√');
  opButtons[10] = new Button(130, 610, 60, 60, '±');
  opButtons[11] = new Button(190, 610, 60, 60, 'e');
  opButtons[12] = new Button(250, 610, 60, 60, 'B');
}

void draw() {
  background (back);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key:" + key);
  println("keyCode" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 106) {
    handleEvent("x", false);
  } else if (keyCode == 61 || keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 111) {
    handleEvent("÷", false);
  }  else if (keyCode == 10) {
    handleEvent("=", false);
  } else if (keyCode == 12 || keyCode == 8) {
    handleEvent("C", false);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() < 20) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }

    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0.0";
    left = true;
    op = ' ';
    l = 0.0;
    r = 0.0;
    result = 0.0;
    numButtons[3].h = 60;
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("+")) {
    op= '+';
    dVal = "0.0";
    left = false;
  } else if (val.equals("-")) {
    op= '-';
    dVal = "0.0";
    left = false;
  } else if (val.equals("x")) {
    op= 'x';
    dVal = "0.0";
    left = false;
  } else if (val.equals("÷")) {
    op= '÷';
    dVal = "0.0";
    left = false;
  } else if (val.equals("=")) {
    preformCalculation();
  }
}



void mouseReleased() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }

  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent(str(opButtons[i].val), false);
    } else  if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else  if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else  if (opButtons[i].on && opButtons[i].val == 'x') {
      handleEvent("x", false);
    } else  if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else  if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else  if (opButtons[i].on && opButtons[i].val == 'S') {
      if (left) {
        l=sq(l);
        dVal = str(l);
      } else {
        r=sq(r);
        dVal = str(r);
      }
    } else  if (opButtons[i].on && opButtons[i].val == '=') {
      handleEvent("=", false);
    } else  if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
      //op= 'π';
      //dVal = "0.0";
    } else  if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l=sqrt(l);
        dVal = str(l);
      } else {
        r=sqrt(r);
        dVal = str(r);
      }
    } else  if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = -1 * l;
        dVal = str(l);
      } else {
        r= r*-1;
        dVal = str(r);
      }
    } else  if (opButtons[i].on && opButtons[i].val == 'e') {
      if (left) {
        l = 2.7182818;
        dVal = str(l);
      } else {
        r= 2.7181818;
        dVal = str(r);
      }
    } else  if (opButtons[i].on && opButtons[i].val == 'B') {
      dVal = "Big 3     ";
      numButtons[3].h += 1;
    }
  }
  println("l: " + l  + "r: " + r  + "op: " + op  + "result: " + result  + "left: " + left );
}


void updateDisplay() {
  fill(disp);
  rect(190, 100, 290, 90);
  fill(255);
  textAlign(RIGHT);
  if (dVal.length() < 12) {
    textSize(44);
  } else if (dVal.length() < 13) {
    textSize (42);
  } else if (dVal.length() < 14) {
    textSize (40);
  } else if (dVal.length() < 15) {
    textSize (38);
  } else if (dVal.length() < 16) {
    textSize (36);
  } else if (dVal.length() < 17) {
    textSize (34);
  } else if (dVal.length() < 18) {
    textSize (32);
  } else if (dVal.length() < 19) {
    textSize (30);
  } else if (dVal.length() < 20) {
    textSize (28);
  } else {
    textSize (26);
  }

  text(dVal, width-55, 120);
}

void preformCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'x') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == '÷') {
    result = l*l;
  }
  dVal = str(result);
  l = result;
  left = true;
}
