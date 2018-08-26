uniform sampler2D sampleTexture;
uniform int textureSize;
uniform int windowSize;

void main() {
  vec4 tColor = texture2D(
    sampleTexture,
    (floor(gl_FragCoord.xy * textureSize / windowSize) + 0.5) / textureSize
  );
  gl_FragColor = tColor;
}
