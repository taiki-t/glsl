precision mediump float;
uniform vec2  m;       // mouse
uniform float t;       // time
uniform vec2  r;       // resolution
uniform sampler2D smp; // prev scene

// gl_FragCoord
// gl_FragColor

void main(void){
// rotation origin
   vec3 ro = vec3(.0, .0, -10.0);
     //vec3 rd = normalize(vec3((gl_FragCoord.xy * 2.0 - r.xy) / min(r.x, r.y), 1.0));
   vec3 p =  vec3(((gl_FragCoord.xy * 2.0 - r.xy) / min(r.x, r.y)), 0.0);
   
   float s = sin(t * 0.8), c = cos(t * 0.3);
   
   mat3 verticalR = mat3(
     1.0, 0, 0,
      0, c, -s,
     0, s, c
   );
   
   mat3 horizontalR =  mat3(
     c, 0, s,
     0, 1, 0,
     -s, 0, c
    );
    
          mat3 xyR =  mat3(
     c, -s, 0,
      s, c, 0,
     0, 0, 1.0
        );
    
    mat3 xyR2 =  mat3(
     c, s, 0,
      s, -c, 0,
     0, 0, 1.0
    );
    
  
  // 縦回転 * 横回転
   mat3 r = verticalR * horizontalR;
    
   const float PI = 3.1415926535897932384626433832795;
    
   float rd = 2.0 * PI / 6.0;
   float q = 0.0;

   for (float i = 0.0; i < 6.0; i++) {
    vec3 circler = vec3(sin(rd * i) *rd 0.5, cos(rd * i) * 0.5, 0.0);
     q += 0.005 / abs(length(p - circler * r) - 0.3);
   }
      //q += 0.005 / abs(length(p) - 0.3);
         
    float screenWidth = cos(q * .3 - PI * 0.44);
    vec3 q2 = (mod(p, screenWidth) - screenWidth * 0.5);
    vec3 q3 = (mod(p, cos(q * 0.1 + PI * 0.44 * 0.986) + 0.2) - screenWidth * 0.5);
    
    q += 0.002 / length(q2.x);
    q += 0.002 / length(q2.y);
    
    // q += 0.001 / length(q3.x);
    // q += 0.001 / length(q3.y);

    // gl_FragColor.rgb = (vec3(0.9, 0.25, -0.7) * ro.y - 0.1);
    gl_FragColor = vec4(vec3(q), 1.0);
    // gl_FragColor.a = 1.0;
}

