uniform sampler2D sampleTexture;
uniform int sampleTextureSize;
uniform int displaySize;

void main() {
  vec4 smpColor = texture2D(
    sampleTexture,
    (floor(gl_FragCoord.xy * sampleTextureSize / displaySize) + 0.5) / sampleTextureSize
  );
  gl_FragColor = smpColor;
}
