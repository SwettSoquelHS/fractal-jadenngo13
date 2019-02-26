ArrayList<Circle> circles;
boolean oscillate;
float x, y, size;
float start = 0;
int end = 0;
int direction = 1;
float c1 = 255, c2 = 0, c3 = 4, rate = 1; //used for oscillating color


void setup() {
  size(800, 800);
  circles = new ArrayList<Circle>();
}


void draw() {
  background(50);
  drawFractal(width/2, height/2, 400);
  colorUpdate(); 
  //oscillate();
  for (Circle c : circles) {
    //c.show(c1, c2, c3);
  }
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

void drawFractal(float x, float y, float radius) {
  pushMatrix();
  translate(x, y);
  stroke(c1, c2, c3);
  noFill();
  Circle c = new Circle(x, y, radius);
  circles.add(c);
  ellipse(0, 0, radius, radius);
  popMatrix();
  if (radius > 8) {
    drawFractal(x + radius/2, y, radius/2);
    drawFractal(x - radius/2, y, radius/2);
    drawFractal(x, y + radius/2, radius/2);
    drawFractal(x, y - radius/2, radius/2);
  }
}

void oscillate() {
  fill(c1, c2, c3);
  arc(width/2, height/2, 100, 100, 0, start, end);
  if (start < 6.3) {
    start+=.01*direction;
  } else {
    start = 0;
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
