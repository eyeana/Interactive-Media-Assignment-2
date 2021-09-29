
int Y_AXIS = 2;
int X_AXIS = 2;
color b1, b2, c1, c2;

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  c1 = color(85, 3, 133);
  c2 = color(67, 232, 229);

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}
