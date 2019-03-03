class KochLine {

  // the starting and ending PVectors for line
  PVector start;
  PVector end;
  int[] colors;

  KochLine(PVector start, PVector end, int[] colors) {
    this.start = start;
    this.end = end;
    this.colors = colors;
  }

  void wiggle(){
    PVector random = PVector.random2D();
    start.add(random);
    random = PVector.random2D();
    end.add(random);
    for(int i = 0; i<colors.length; i++) {
      colors[i] += (int)random(-10, 10);
    }
  }

  void show() {
    stroke(colors[0], colors[1], colors[2]);
    line(start.x, start.y, end.x, end.y);
  }

  PVector start() {
    return start.copy();
  }

  PVector end() {
    return end.copy();
  }

  // first 1/3 of the line
  PVector left() {
    PVector v = PVector.sub(end, start);
    v.div(3);
    v.add(start);
    return v;
  }    

  // Find the angle where the line should be placed
  PVector middle() {
    PVector v = PVector.sub(end, start);
    v.div(3);
    
    PVector p = start.copy();
    p.add(v);
    
    v.rotate(-radians(60));
    p.add(v);
    
    return p;
  }    

  // 2/3 of the line
  PVector right() {
    PVector v = PVector.sub(start, end);
    v.div(3);
    v.add(end);
    return v;
  }
}
