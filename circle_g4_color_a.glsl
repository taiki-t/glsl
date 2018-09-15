precision mediump float;
uniform vec2  m;       // mouse
uniform float t;       // time
uniform vec2  r;       // resolution
uniform sampler2D smp; // prev scene

// gl_FragCoord
// gl_FragColor

void main(void){
// rotation origin
   vec3 ro = vec3(.0, .0, -10.0);10
   //vec3 rd = normalize(vec3((gl_FragCoord.xy * 2.0 - r.xy) / min(r.x, r.y), 1.0));
   vec3 p =  vec3(((gl_FragCoord.xy * 2.0 - r.xy) / min(r.x, r.y)), 0.0) * 1.2;
   
   float s = sin(t * 0.8), c = cos(t * 0.3);
   
   mat3 verticalR = mat3(
     1.0, 0, 0,
      0, c, -s,
     0, s, c
   ) * 1.1;
   
          mat3 horizontalR =  mat3(
     c, 0, s,
     0, 1, 0,
     -s, 0, c
     )* 1.1;
    
    mat3 xyR =  mat3(
     c, -s, 0,
      s, c, 0,mat3
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
   float circle = 0.0;

   for (float i = 0.0; i < 6.0; i++) {
    float current = circle;
        vec3 circler = vec3(sin(rd * i) * 0.5, cos(rd * i) * 0.5, i * i *i * 0.01);
     current = (0.0003 + circle * 0.6) / abs(length(p - circler * r + circle) - 0.3);
     //circle += clamp(current, -1.0, 0.6);
     circle += current;
   }
      //q += 0.005 / abs(length(p) - 0.3);
         
    float screenWidth = cos(circle * .3 - PI * 0.44);
    vec3 p2 = (mod(p, screenWidth) - screenWidth * 0.5);
    // vec3 p3 = (mod(p, cos(circle * 0.1 + PI * 0.44 * 0.986) + 0.2) - screenWidth * 0.5);
    
    float q = circle;
    
    float gridX = 0.002 / length(p2.x);
    float gridY = 0.002 / length(p2.y);
    
    // q += gridX; 
    // q += gridY;
    
    float cr = 0.0;
    float cb = 0.0;
    float cg = 0.0;
    
    vec3 p3 = (mod(p, cos(circle * .4 - PI * 0.441)) - screenWidth * 0.5);
    cr += 0.002 / (length(p3.x) * 1.);
    cr += 0.002 / (length(p3.y) * 1.);
    
    vec3 p4 = (mod(p, cos(circle * .5 - PI * 0.442)) - screenWidth * 0.5);
    cg += 0.002 / (length(p4.x) * 1.);
    cg += 0.002 / (length(p4.y) * 1.);
    
    vec3 p5 = (mod(p, cos(circle * .61 - PI * 0.4429)) - screenWidth * 0.5);
    cb += 0.002 / (length(p5.x) * 1.);
    cb += 0.002 / (length(p5.y) * 1.);
    // float qm = 0.0;
    // qm += 0.002 / length(q2.y) - sin(t);
    
    // q += 0.001 / length(q3.x);
    // q += 0.001 / length(q3.y);

    // gl_FragColor.rgb = (vec3(0.9, 0.25, -0.7) * ro.y - 0.1);
    gl_FragColor = vec4(vec3(q + cr * 0.9 * (p.y + p.x + atan(t* 1.2) + cos(t * 1.8)) / (p.y) * 2.2  *sin(t), q + cg * 1.88, q + cb * abs(p.x) * 9.9), 1.0);
    // gl_FragColor.a = 1.0;
}

