PShader SHADER;
PGraphics P_GRAPHICS;

void setup() {
  size(1000, 1000, P2D);
  P_GRAPHICS = createGraphics(width, height, P2D);
  P_GRAPHICS.beginDraw();
  P_GRAPHICS.background(255);
  P_GRAPHICS.endDraw();
  P_GRAPHICS.rectMode(CENTER);
  SHADER = loadShader("fragment.glsl", "vertex.glsl");
  SHADER.set("windowSize", width);
}

void draw() {
  P_GRAPHICS.beginDraw();
  P_GRAPHICS.fill(0);
  P_GRAPHICS.noStroke();
  P_GRAPHICS.rect(mouseX, mouseY, 100, 100);
  P_GRAPHICS.endDraw();
  SHADER.set("sampleTexture", P_GRAPHICS.get());
  // image(P_GRAPHICS, 0, 0);
  shader(SHADER);
  rect(0, 0, width, height);
}
