uniform mat4 transform;
attribute vec4 vertex;

// vertex
// (0, 0) ... (width, 0)
// ...
// (0, height) ... (width, height)

// vertex.z should from -1 to 1. Maybe because of camera?
// vertex.w is related with scale. 1.0: same size

void main() {
  vec4 shiftedVertex = vec4(vertex.x - 50.0, vertex.y - 75.0, 0.0, 1.0);
  gl_Position = transform * shiftedVertex;
}
