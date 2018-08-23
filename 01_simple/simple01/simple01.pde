PShader SHADER;

void setup() {
  size(1000, 1000, P2D);
  SHADER = loadShader("fragment.glsl", "vertex.glsl");
}

void draw() {
  shader(SHADER);
  rect(100, 100, width - 200, height - 200);
}
