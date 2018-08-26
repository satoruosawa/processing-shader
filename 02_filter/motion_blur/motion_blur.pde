PShader SHADER;
PGraphics PG;
boolean IS_FIRST_FRAME = true;

void setup() {
  size(1000, 1000, P2D);
  background(0);
  PG = createGraphics(width, height, P2D);
  PG.beginDraw();
  PG.background(0);
  PG.endDraw();
  SHADER = loadShader("fragment.glsl", "vertex.glsl");
  SHADER.set("windowSize", new PVector(width, height, 0));
}

void draw() {
  if (IS_FIRST_FRAME) {
    // XXX: When you use P2D mode, The first screen turns red. You have to change color that way.
    background(0);
    IS_FIRST_FRAME = false;
  }
  SHADER.set("sampleTexture", get());
  PG.beginDraw();
  PG.shader(SHADER);
  PG.fill(0);
  PG.rect(0, 0, width, height);
  PG.resetShader();
  PG.fill(255);
  PG.noStroke();
  PG.ellipse(mouseX, mouseY, 100, 100);
  PG.endDraw();
  image(PG, 0, 0);
}
