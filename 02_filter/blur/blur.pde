PShader V_BLUR;
PShader H_BLUR;

void setup() {
  size(1000, 1000, P2D);
  background(255);
  V_BLUR = loadShader("fragment.glsl");
  V_BLUR.set("textureSize", new PVector(width, height, 0));
  V_BLUR.set("amount", 10.0);
  V_BLUR.set("isVertical", true);
  H_BLUR = loadShader("fragment.glsl");
  H_BLUR.set("textureSize", new PVector(width, height, 0));
  H_BLUR.set("amount", 10.0);
  H_BLUR.set("isVertical", false);
}

void draw() {
  background(255);
  fill(0);
  noStroke();
  rect(mouseX, mouseY, 100, 100);
  rect(100, 100, 100, 100);
  V_BLUR.set("sampleTexture", get());
  shader(V_BLUR); {
    rect(0, 0, width, height);
  } resetShader();
  H_BLUR.set("sampleTexture", get());
  shader(H_BLUR); {
    rect(0, 0, width, height);
  } resetShader();
}
