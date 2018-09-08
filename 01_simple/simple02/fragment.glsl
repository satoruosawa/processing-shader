uniform sampler2D sampleTexture;
uniform vec3 textureSize;
uniform vec3 windowSize;

// gl_FragCoord.xy
// (0.5, texture.y - 0.5) ... (texture.x - 0.5, texture.y - 0.5)
// ...
// (0.5, 0.5) ... (texture.x - 0.5, 0.5)

void main() {
  vec2 scaledCoord = floor(gl_FragCoord.xy * textureSize.xy / windowSize.xy) + 0.5;
  // vec2 scaledCoord = gl_FragCoord.xy * textureSize.xy / windowSize.xy;  // direct coord
  vec4 tColor = texture2D(
    sampleTexture,
    vec2(scaledCoord.x / textureSize.x, 1.0 - scaledCoord.y / textureSize.y)
  );
  gl_FragColor = tColor;
}
