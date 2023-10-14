#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uSize;
uniform float iTime;

out vec4 fragColor;

// White background with grey horizontal lines
void main() {
    vec2 uv = gl_FragCoord.xy / uSize;
    vec3 lineColor = vec3(0.61);
    vec3 backgroundColor = vec3(1.0);

    // use step to create the lines
    vec3 color = mix(backgroundColor, lineColor, step(0.96, fract(uv.y * 15.0)));

    fragColor = vec4(color, 1.0);
}
