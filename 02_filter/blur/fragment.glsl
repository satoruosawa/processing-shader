uniform sampler2D sampleTexture;
uniform vec3 textureSize;
uniform float amount; // 1 -
uniform bool isVertical;

void main(void)	{
  vec4 colorSum = vec4(0.0);
  float volumeSum = 0.0;
  int resolution = int(amount); // any number
  for (int i = -resolution; i <= resolution; i++) {
    float shiftAmount = amount * float(i) / float(resolution);
    vec2 shiftCoord = vec2(shiftAmount, 0.0);
    if (isVertical) {
      shiftCoord = vec2(0.0, shiftAmount);
    }
    vec4 color = texture2D(
      sampleTexture,
      vec2(
        (gl_FragCoord.x + shiftCoord.x) / textureSize.x,
        ((textureSize.y - 1) - gl_FragCoord.y + shiftCoord.y) / textureSize.y
      )
    );
    float volume = (float(resolution) + 1.0) - abs(float(i));
    colorSum += volume * color;
    volumeSum += volume;
  }
  gl_FragColor = vec4((colorSum / volumeSum).rgb, 1.0);
}
