PShader SHADER;

void setup() {
  size(1080, 1080, P2D);
  SHADER = loadShader("fragment.glsl");
}

void draw() {
  shader(SHADER);
  rect(0, 0, width, height);
}
