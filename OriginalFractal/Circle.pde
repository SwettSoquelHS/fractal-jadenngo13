class Circle {
  float x, y, radius;
  float a;

  Circle(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    a = random(0, 100);
  }

  void show(float c1, float c2, float c3) { //<>//
    pushMatrix();
    translate(x, y);
    stroke(c1, c2, c3);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
}
