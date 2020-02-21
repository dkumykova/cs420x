#ifdef GL_ES
precision mediump float;
#endif

// below is the line that imports our noise function
#pragma glslify: snoise3 = require(glsl-noise/simplex/3d)
#pragma glslify: ascii   = require(glsl-ascii-filter)


uniform float time;
uniform vec2 resolution;

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;
  //float noise = snoise3( vec3(uv.x*100., uv.y*100., time/50.) );

  
  float noise = snoise3( vec3(uv.x*10., uv.y*10., time/250.) );
  float ascii_out = ascii( vec3(noise), uv );
  gl_FragColor = vec4(ascii_out,.2,ascii_out, 1. );

  
  //gl_FragColor = vec4( noise, noise, noise, 1. );
}