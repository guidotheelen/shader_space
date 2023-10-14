// Scalable grid

#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uSize;
uniform float iTime;
uniform float intensity;

out vec4 fragColor;

vec4 lineColor = vec4(0.3, 0.3, 0.3, 1.0);
vec2 pitch = vec2(50.0 * intensity, 50.0 * intensity);

void main() {
    if(mod(gl_FragCoord.x, pitch[0]) < 1. ||
        mod(gl_FragCoord.y, pitch[1]) < 1.) {
        fragColor = lineColor;
    } else {
        fragColor = vec4(1.0);
    }
}
