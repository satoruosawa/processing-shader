uniform sampler2D sampleTexture;
uniform int windowSize;

void main() {
  gl_FragColor = texture2D(sampleTexture,
    vec2(gl_FragCoord.x / windowSize, (windowSize - gl_FragCoord.y) / windowSize)
  );
}
