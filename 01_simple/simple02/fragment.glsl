uniform sampler2D sampleTexture;
uniform vec3 textureSize;
uniform vec3 windowSize;

// gl_FragCoord.xy
// (0.5, 0.5) ... (texture.x - 0.5, 0.5)
// ...
// (0.5, texture.y - 0.5) ... (texture.x - 0.5, texture.y - 0.5)

// texture2D samples below
// (0.5 / textureSize.x, 0.5 / textureSize.y) ... ((texture.x - 0.5) / textureSize.x, 0.5 / textureSize.y)
// ...
// (0.5 / textureSize.x, (texture.y - 0.5) / textureSize.y) ... ((texture.x - 0.5) / textureSize.x, (texture.y - 0.5) / textureSize.y)

void main() {
  vec4 tColor = texture2D(
    sampleTexture,
    vec2(
      (floor(gl_FragCoord.x * textureSize.x / windowSize.x) + 0.5) / textureSize.x,
      (floor(gl_FragCoord.y * textureSize.y / windowSize.y) + 0.5) / textureSize.y
    )
  );
  gl_FragColor = tColor;
}
