// Starry sky

#include <flutter/runtime_effect.glsl>

precision mediump float;

uniform vec2 uSize;
uniform float iTime;
uniform float intensity;

out vec4 fragColor;

const vec3 skycolour2 = vec3(0.2, 0.4, 0.6);
const vec3 skycolour1 = vec3(0.06, 0.14, 0.22);

void main() {
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = gl_FragCoord.xy / uSize;

    // Gradient
    vec3 skycolour = mix(skycolour1, skycolour2, uv.y * uv.x);

    // Stars
    float stars = 0.0;
    for(int i = 0; i < 100; i++) {
        float x = fract(sin(float(i) * 12.9898 + 1.0) * 43758.5453);
        float y = fract(sin(float(i) * 4.1414 + 2.0) * 43758.5453);
        vec2 star = vec2(x, y);
        float dist = distance(uv, star);
        stars += smoothstep(0.005, 0.0, dist);
    }

    // Add stars
    skycolour += stars;

    fragColor = vec4(skycolour, 1.0);

}
