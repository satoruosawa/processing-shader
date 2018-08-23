PShader SHADER;
PImage IMAGE;

void setup() {
  size(1000, 1000, P2D);
  SHADER = loadShader("fragment.glsl", "vertex.glsl");
  int sampleTextureSize = 10;
  IMAGE = createImage(sampleTextureSize, sampleTextureSize, RGB);
  SHADER.set("sampleTextureSize", sampleTextureSize);
  SHADER.set("displaySize", width);
}

void draw() {
  int index = (int)random(IMAGE.pixels.length);
  IMAGE.pixels[index] = color(255, 255, 255, 100);
  IMAGE.updatePixels();
  SHADER.set("sampleTexture", IMAGE);
  shader(SHADER);
  rect(0, 0, width, height);
}
