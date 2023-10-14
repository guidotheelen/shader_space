// Alternating dot

#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uSize;
uniform float iTime;
uniform float intensity;

out vec4 fragColor;

void main() {
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = (gl_FragCoord.xy - uSize / 2.0) / uSize.y;
    float time = iTime * 4;
    float pulse = sin(time) / 20;

    // Red circle in the middle of the screen
    float dis = distance(uv, vec2(0.));
    float cir = step(0.2, dis + pulse);

    // Output to screen
    fragColor = vec4(cir, 0.0, 0.0, 1.0);
}
