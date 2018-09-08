PShader SHADER;

void setup() {
  size(1080, 1080, P2D);
  background(255);
  SHADER = loadShader("fragment.glsl");
  SHADER.set("textureSize", new PVector(width, height));
  SHADER.set("amount", new PVector(10, 10));
}

void draw() {
  background(255);
  noStroke();
  fill(0);
  rect(100, 100, width - 200, height - 200);
  SHADER.set("sampleTexture", get());
  shader(SHADER); {
    rect(0, 0, width, height);
  } resetShader();
  fill(100);
  rect(0, 0, 100, 100);
  rect(width - 100, 0, 100, 100);
  rect(0, height - 100, 100, 100);
  rect(width - 100, height - 100, 100, 100);
}
