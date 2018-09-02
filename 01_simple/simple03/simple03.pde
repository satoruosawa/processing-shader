PShader SHADER;
PGraphics PG;

void setup() {
  size(1000, 1000, P2D);
  background(255);
  SHADER = loadShader("fragment.glsl");
  SHADER.set("textureSize", new PVector(width, height, 0));
}

void draw() {
  noStroke();
  background(255);
  fill(0);
  rect(100, 100, 100, 100);
  SHADER.set("sampleTexture", get());
  shader(SHADER); {
    rect(0, 0, width, height);
  } resetShader();
}
