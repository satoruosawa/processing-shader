PShader SHADER;
PImage IMAGE;

PVector TEXTURE_SIZE;

void setup() {
  size(1080, 1080, P2D);
  TEXTURE_SIZE = new PVector(10, 20);
  SHADER = loadShader("fragment.glsl", "vertex.glsl");
  IMAGE = createImage((int)TEXTURE_SIZE.x, (int)TEXTURE_SIZE.y, RGB);
  SHADER.set("textureSize", TEXTURE_SIZE);
  SHADER.set("windowSize", new PVector(width, height));
}

void draw() {
  int index = (int)random(IMAGE.pixels.length);
  IMAGE.pixels[index] = color(255, 255, 255, 100);
  IMAGE.updatePixels();
  SHADER.set("sampleTexture", IMAGE);
  shader(SHADER);
  rect(0, 0, TEXTURE_SIZE.x, TEXTURE_SIZE.y);
}
