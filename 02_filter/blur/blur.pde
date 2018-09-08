PShader V_BLUR;
PShader H_BLUR;

void setup() {
  size(1000, 1000, P2D);
  background(255);
  V_BLUR = loadShader("fragment.glsl");
  V_BLUR.set("textureSize", new PVector(width, height));
  V_BLUR.set("amount", 20);
  V_BLUR.set("isVertical", true);
  H_BLUR = loadShader("fragment.glsl");
  H_BLUR.set("textureSize", new PVector(width, height));
  H_BLUR.set("amount", 20);
  H_BLUR.set("isVertical", false);
}

void draw() {
  background(255);
  noStroke();
  fill(255, 0, 0);
  rect(1, 1, 100, 100);
  fill(0, 255, 0);
  rect(width - 101, 1, 100, 100);
  fill(255, 255, 0);
  rect(1, height - 101, 100, 100);
  fill(0, 0, 255);
  rect(width - 101, height - 101, 100, 100);
  fill(0);
  rect(mouseX, mouseY, 100, 100);
  V_BLUR.set("sampleTexture", get());
  shader(V_BLUR); {
    rect(0, 0, width, height);
  } resetShader();
  H_BLUR.set("sampleTexture", get());
  shader(H_BLUR); {
    rect(0, 0, width, height);
  } resetShader();
}
