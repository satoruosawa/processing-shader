PShader SHADER;

void setup() {
  size(1000, 1000, P2D);
  SHADER = loadShader("fragment.glsl", "vertex.glsl");
  SHADER.set("skyBlue", new PVector(0.54, 0.74, 0.87));
}

void draw() {
  shader(SHADER);
  rect(100, 100, width - 200, height - 200);
}
