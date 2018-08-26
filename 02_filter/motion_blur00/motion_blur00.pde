PShader SHADER;
PGraphics[] GRAPHICS;
int REF_GRAPHICS;
int TARGET_GRAPHICS;

void setup() {
  size(1000, 1000, P2D);
  GRAPHICS = new PGraphics[2];
  for (int i = 0; i < 2; i++) {
    GRAPHICS[i] = createGraphics(width, height, P2D);
    GRAPHICS[i].beginDraw();
    GRAPHICS[i].background(0);
    GRAPHICS[i].endDraw();
  }
  REF_GRAPHICS = 0;
  TARGET_GRAPHICS = 1;
  SHADER = loadShader("fragment.glsl", "vertex.glsl");
  SHADER.set("windowSize", new PVector(width, height, 0));
}

void draw() {
  int temp = REF_GRAPHICS;
  REF_GRAPHICS = TARGET_GRAPHICS;
  TARGET_GRAPHICS = temp;
  SHADER.set("sampleTexture", GRAPHICS[REF_GRAPHICS].get());
  GRAPHICS[TARGET_GRAPHICS].beginDraw();
  GRAPHICS[TARGET_GRAPHICS].shader(SHADER);
  GRAPHICS[TARGET_GRAPHICS].rect(0, 0, width, height);
  GRAPHICS[TARGET_GRAPHICS].resetShader();
  GRAPHICS[TARGET_GRAPHICS].fill(255);
  GRAPHICS[TARGET_GRAPHICS].noStroke();
  GRAPHICS[TARGET_GRAPHICS].ellipse(mouseX, mouseY, 100, 100);
  GRAPHICS[TARGET_GRAPHICS].endDraw();
  image(GRAPHICS[TARGET_GRAPHICS], 0, 0);
}
