uniform mat4 transform;
uniform vec3 textureSize;
uniform vec3 windowSize;
attribute vec4 vertex;

void main() {
  vec4 scaledVertex = vec4(
    vertex.x * windowSize.x / textureSize.x,
    vertex.y * windowSize.y / textureSize.y,
    vertex.z,
    vertex.w
  );
  gl_Position = transform * scaledVertex;
}
