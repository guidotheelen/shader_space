#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uSize;
uniform float iTime;
uniform float intensity;

out vec4 fragColor;

void main() {
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = (gl_FragCoord.xy - uSize / 2.0) / uSize.y;

    // Red circle in the middle of the screen
    float dist = distance(uv, vec2(0.));
    float circle = step(0.1, dist * intensity);

    // Output to screen
    fragColor = vec4(circle, 0.0, 0.0, 1.0);
}
