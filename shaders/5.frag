// Standing waves

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

    float cir = 0.0;
    cir += sin(uv.x * 100.0 * intensity + time) / 2.0;
    cir += sin(uv.y * 100.0 * intensity + time) / 2.0;
    cir += sin(length(uv * 100.0 * intensity) + time) / 2.0;
    cir += pulse;

    // Output to screen
    fragColor = vec4(cir, 0.0, 0.0, 1.0);
}
