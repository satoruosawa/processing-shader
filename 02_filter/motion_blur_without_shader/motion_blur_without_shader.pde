void setup() {
  size(1080, 1080);
  background(0);
}

void draw() {
  loadPixels();
  for (int i = 0; i < width * height; i++) {
    color c = pixels[i];
    float coef = 0.9;
    pixels[i] = color(red(c) * coef, green(c) * coef, blue(c) * coef);
  }
  updatePixels();
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 100, 100);
}
