uniform sampler2D sampleTexture;
uniform vec3 textureSize;

// gl_FragCoord.xy
// (0.5, texture.y - 0.5) ... (texture.x - 0.5, texture.y - 0.5)
// ...
// (0.5, 0.5) ... (texture.x - 0.5, 0.5)

void main() {
  vec4 tColor = texture2D(
    sampleTexture,
    vec2(gl_FragCoord.x / textureSize.x, 1.0 - gl_FragCoord.y / textureSize.y)
  );
  if (tColor.x == 0) {
    tColor = vec4(1, 0, 0, 1);
  }
  gl_FragColor = tColor;
}
