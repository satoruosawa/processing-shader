PShader SHADER;
boolean IS_FIRST_FRAME = true;

void setup() {
  size(1080, 1080, P2D);
  background(0);
  SHADER = loadShader("fragment.glsl");
  SHADER.set("windowSize", new PVector(width, height));
}

void draw() {
  if (IS_FIRST_FRAME) {
    // XXX: When you use P2D mode, The first screen turns red. You have to change color that way.
    background(0);
    IS_FIRST_FRAME = false;
  }
  SHADER.set("sampleTexture", get());
  shader(SHADER); {
    rect(0, 0, width, height);
  } resetShader();
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 100, 100);
}
