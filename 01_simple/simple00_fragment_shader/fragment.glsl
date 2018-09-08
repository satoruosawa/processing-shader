void main() {
  vec4 color = vec4(0, 0, 0, 1);
  if (gl_FragCoord.y < 400) {
    color = vec4(0.5, 0.5, 0.5, 1);
  }
  gl_FragColor = vec4(color);
}
