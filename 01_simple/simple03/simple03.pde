PShader SHADER;
PGraphics PG;

void setup() {
  size(1080, 1080, P2D);
  background(255);
  SHADER = loadShader("fragment.glsl");
  SHADER.set("textureSize", new PVector(width, height));
}

void draw() {
  background(255);
  noStroke();
  fill(0);
  rect(1, 1, 100, 100);
  rect(width - 101, 1, 100, 100);
  rect(1, height - 101, 100, 100);
  rect(width - 101, height - 101, 100, 100);
  rect(mouseX, mouseY, 100, 100);
  SHADER.set("sampleTexture", get());
  shader(SHADER); {
    rect(0, 0, width, height);
  } resetShader();
}
