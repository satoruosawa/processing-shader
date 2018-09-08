PShader SHADER;
PImage IMAGE;

void setup() {
  size(1080, 1080, P2D);
  PVector textureSize = new PVector(10, 20);
  SHADER = loadShader("fragment.glsl", "vertex.glsl");
  IMAGE = createImage((int)textureSize.x, (int)textureSize.y, RGB);
  SHADER.set("textureSize", textureSize);
  SHADER.set("windowSize", new PVector(width, height));
}

void draw() {
  int index = (int)random(IMAGE.pixels.length);
  IMAGE.pixels[index] = color(255, 255, 255, 100);
  IMAGE.updatePixels();
  SHADER.set("sampleTexture", IMAGE);
  shader(SHADER);
  rect(0, 0, width, height);
}
