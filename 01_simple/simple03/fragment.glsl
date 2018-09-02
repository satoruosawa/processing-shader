uniform sampler2D sampleTexture;
uniform vec3 textureSize;

void main() {
  vec4 tColor = texture2D(
    sampleTexture,
    vec2 (
      (floor(gl_FragCoord.x) + 0.5) / textureSize.x,
      ((textureSize.y - 1) - floor(gl_FragCoord.y) + 0.5) / textureSize.y
    )
  );
  if (tColor.x == 0) {
    tColor = vec4(1, 0, 0, 1);
  }
  gl_FragColor = tColor;
}
