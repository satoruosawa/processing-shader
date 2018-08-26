uniform sampler2D sampleTexture;
uniform vec3 windowSize;

void main() {
  gl_FragColor = texture2D(sampleTexture,
    vec2(
      gl_FragCoord.x / windowSize.x,
      (windowSize.y - gl_FragCoord.y) / windowSize.y
    )
  );
}
