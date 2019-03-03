ArrayList<KochLine> lines;
boolean morph;

void setup() {
  size(700, 400);
  lines = new ArrayList<KochLine>();
  PVector start = new PVector(0, height-50);
  PVector end = new PVector(width, height-50);
  int[] colors = {17, 38, 245};
  lines.add( new KochLine(start, end, colors) );
}


void draw() {
  background(255);
  for (KochLine line : lines) {
    line.show();
    if (morph) {
      line.wiggle();
    }
  }
}


void keyPressed() {
  if (key == ' ') {
    generate();
  }
}


void mousePressed() {
  morph = true;
}


void mouseReleased() {
  morph = false;
}


void generate() {
  ArrayList<KochLine> nextGen = new ArrayList<KochLine>();
  for (KochLine line : lines) {
    //calculate the new PVectors
    PVector a = line.start();
    PVector b = line.left();
    PVector c = line.middle();
    PVector d = line.right();
    PVector e = line.end();
    //get color of line
    int[] colors = {line.colors[0], line.colors[1], line.colors[2]};
    //make new line segments between the new PVectors
    nextGen.add( new KochLine(a, b, colors) );
    nextGen.add( new KochLine(b, c, colors) );
    nextGen.add( new KochLine(c, d, colors) );
    nextGen.add( new KochLine(d, e, colors) );
  }
  lines = nextGen;
}
