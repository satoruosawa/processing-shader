uniform sampler2D sampleTexture;
uniform vec3 windowSize;

void main() {
   vec4 tColor = texture2D(sampleTexture,
    vec2(
      gl_FragCoord.x / windowSize.x,
      (windowSize.y - gl_FragCoord.y) / windowSize.y
    )
  );
  gl_FragColor = vec4(tColor.rgb * 0.9, 1);
}
