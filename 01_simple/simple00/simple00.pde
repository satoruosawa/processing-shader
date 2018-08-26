PShader SHADER;

void setup() {
  size(1000, 1000, P2D);
  SHADER = loadShader("fragment.glsl");
}

void draw() {
  shader(SHADER);
  rect(0, 0, width, height);
}
