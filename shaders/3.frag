#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uSize;
uniform float iTime;

out vec4 fragColor;

void main() {
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = (gl_FragCoord.xy - uSize / 2.0) / uSize.y;

    // Red circle in the middle of the screen
    float d = distance(uv, vec2(0.));
    float c = smoothstep(0.25, 0.2475, d);

    // Output to screen
    fragColor = vec4(c, 0.0, 0.0, 1.0);
}
