float sourceAngle = 10;
float rate = 0;
boolean newCircle, fastRotate;
int total;
float[] colors = {39, 26, 234};

void setup() {
  size(800, 800);
  background(50);
  total = 200;
}


void draw() {
  background(50);
  generateFractal(width/2, height/2, 50, sourceAngle, 0, colors);
  //generate new circles
  if (newCircle) { 
    total++;
  }
  //rotate the circle faster
  if (fastRotate) {
    if (rate < 3) {
      rate+=.05;
    }
    sourceAngle+=rate;
  } else {
    if (rate > 0) {
      rate-=.05;
    }
    sourceAngle+=rate;
  }
}

/* IMPORTANT KEY PRESSES FOR FRACTAL ANIMATION*/
void mousePressed() {
  newCircle = true;
}

void mouseReleased() {
  newCircle = false;
}

void keyPressed() {
  if (key == ' ') {
    fastRotate = true;
  }
}

void keyReleased() {
  if (key == ' ') {
    if (fastRotate) {
      fastRotate=!fastRotate;
    }
  }
}


void generateFractal(float x, float y, int size, float angle, int num, float[] colors) {
  pushMatrix();
  translate(x, y);
  rotate(radians(angle));
  fill(colors[0], colors[1], colors[2]);
  ellipse(num, 0, 10, 10);
  popMatrix();
  if (num < total) {
    num+=1;
    angle+=10;
    float[] c = {colors[0], colors[1]+.5, colors[2]};
    generateFractal(x, y, size, angle, num, c);
  }
}
