boolean oscillate;
float x, y, size;
float start = 0;
float angle = 1, swing = 1;
int end = 0;
int direction = 1;
float c1 = 255, c2 = 0, c3 = 4, rate = 1; //used for oscillating color

void setup() {
  size(800, 800);
}


void draw() {
  //background(50);
  angle+=.09;
  drawFractal(width/2+(float)(90*Math.cos(angle)), height/2+(float)(90*Math.sin(angle)), 200, (float)(90*Math.sin(angle)));
}


void mousePressed() {
  if (key == 'f') {
    oscillate = true;
  }
}

void mouseReleased() {
  if (key == 'f') {
    oscillate = false;
  }
}


void drawFractal(float x, float y, float size, float angle) {
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  ellipse(0, 0, size, size);
  popMatrix();
  if (size > 20) {
    drawFractal(x + size/2, y + size/2, size*.75, angle+10);
  }
}


void colorUpdate() {
  if (c3 < 250) {
    c3 += rate;
  } else {
    if (c1 > 10) {
      c1 -= rate;
    } else {
      if (c2 < 250) {
        c2 += rate;
      } else { 
        if (c3 > 250) {
          c1 = 255;
          c2 = 0;
          c3 = 4;
        }
      }
    }
  }
}
