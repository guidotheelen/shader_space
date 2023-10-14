#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uSize;
uniform float iTime;

out vec4 fragColor;

void main() {
  // Normalized pixel coordinates (from 0 to 1)
  vec2 uv = gl_FragCoord.xy / uSize;

  float t = 4 * iTime;

  // Time varying pixel color
  vec3 col = 0.5 + 0.5 * cos(t + uv.xyx + vec3(0, 1, 4));

  // Output to screen
  fragColor = vec4(col, 1.0);
}
