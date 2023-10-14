#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uSize;
uniform float iTime;
uniform float intensity;

out vec4 fragColor;

// Square grid
void main() {
    vec2 uv = (gl_FragCoord.xy - uSize / 2.0) / uSize.y;

    fragColor = vec4(0.0);
}
