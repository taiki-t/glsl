precision mediump float;
uniform vec2  m;       // mouse
uniform float t;       // time
uniform vec2  r;       // resolution
uniform sampler2D smp; // prev scene

void main(void){
vec2 p = (gl_FragCoord.xy * 2.0 - r) / min(r.x, r.y);

float s = sin(t * 0.3);
float c =       cos(t * 0.3);

mat2 rotateX = mat2(
c, -s,
s, c
    );

float smpepRate = .1;// + s * 0.1 - .4;
float waveRate = sin(t) * 0.5 + 0.5;
waveRate = 1.0;
float offsetRatio = .5 * waveRate;


vec2 mesh = mod(p, sepRate) - sepRate * offsetRatio;
// mesh *= rotateX;
float gravity =  0.001 / length(mesh.x * mesh.y);


float PI = 3.14159265359;
floatloat number_of_circles = 3.0;
float pi_ratio = PI / number_of_circles;number_of_circles

float circles = 0.0;

    p *= rotateX;
  //  p = abs(mod(p, 1.5))rotateX * mat2(
  //  c, s,
// -s, c
  //  );
  //  p = abs(mod(p, 1.2)) *      mat2(
  //  c, s,
// -s, c
  //  );
  //  p = (mod(p, 1.3)) * mat2(
        //  c, -s,
// s, c
  //  );

for (float i = 0.0; i < 6.0; i++) {
           float x = sin(pi_ratio * i) * 0.5 * s;
   float y = cos(pi_ratio *cos i) * 0.5 * c;
   //circles += abs(length(p + (PI / 6.0) * i ) - .1) +PI (sin(t * 0.8) * 0.5 - 0.5);
   circles += 0.005 / abs(length(p + vec2(x, y)) - 0.9 * (s * 0.5 + 0.6));
}

float render = circles / (1.0 -float (clamp(sin(t * 0.5), -0.5, 1.5) + 0.5) + gravity * (clamp(sin(t *0.5), -0.5, 1.5) + 0.5));


float color = length(render);

    gl_FragColor = vec4(vec3(color * 1.gl_FragColor2, color* 1.0, color * 1.3), 1.0);

}
  
