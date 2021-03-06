
  vec4 colorful(){ //colorful thingy
  vec2 p = uv();
  float color = 0.; 
  float frequency = 2.;
  float gain = 1.;
  float thickness = .02;

  for( float i = 0.; i < 10.; i++ ) { 
    p.x += cos(p.y + time) * mod(p.y/p.x, 1.); 
    color += abs( thickness / p.x );
  }
  
    
  return gl_FragColor = vec4( p.y, p.x, vec2(color));
	//gl_FragColor = vec4(black, 1.0);

  }

    

  vec4 ink(){
  vec2 p = uv();
  float color = 0.; 
  float frequency = 2.;
  float gain = 1.;
  float thickness = .02;

  for( float i = 0.; i < 10.; i++ ) { 
    p.x += mix(cos(p.x + time) * p.y*p.x, p.y, p.y); 
    color += sign( thickness / p.x );
  }
  
    
  return gl_FragColor = vec4(color);
	//gl_FragColor = vec4(black, 1.0);
    //ink
  }

  
  vec4 ink2(){
  vec2 p = uv();
  float color = 0.; 
  float frequency = 2.;
  float gain = 1.;
  float thickness = .02;

  for( float i = 0.; i < 10.; i++ ) { 
    p.x += mix(cos(p.x + time) * p.y, p.y, p.y); 
    color += sign( thickness / p.x );
  }
  
    
  return gl_FragColor = vec4(color);
	//gl_FragColor = vec4(black, 1.0);

    //better ink
  }

  vec4 rainbowJelly() { //rainbow jellyfish thingy
    
  vec2 p = uv();
  float color = 0.; 
  float frequency = 2.;
  float gain = 1.;
  float thickness = .02;

  for( float i = 0.; i < 10.; i++ ) { 
    p.x += mix(cos(p.x - time) * p.x, p.y, p.y); 
    color += fract( -thickness / p.x);
    color+= mod(p.x, p.y);
  }
   vec2 toCenter = vec2(0.5)-p;
   float angle = atan(toCenter.y,toCenter.x);
   float radius = length(toCenter)*2.0;
   
   vec3 t = hsv2rgb(vec3((angle/6.4)+sin(time),radius,1.0));
   
    
  gl_FragColor = vec4(t, 1.);
	//gl_FragColor = vec4(black, 1.0);
}



vec4 orangeWave () { //orange wave
    
  vec2 p = uv();
  float color = 0.; 
  float frequency = 2.;
  float gain = 1.;
  float thickness = .02;

  for( float i = 0.; i < 10.; i++ ) { 
    p.y += fract(sin(p.x - time) * p.x+ p.y+ p.y); 
    color += fract(thickness / p.x);
    color+= mod(p.x, p.y);
  }
   vec2 toCenter = vec2(0.1)+p;
   float angle = atan(toCenter.y,toCenter.y);
   float radius = length(toCenter);
   
   vec3 t = hsv2rgb(vec3((angle/5.),radius,1.0));
   
    
  return gl_FragColor = vec4(t, 1.);
	//gl_FragColor = vec4(black, 1.0);
}




vec4 fire() { //pulsating fire thing
    
  vec2 p = uv();
  float color = 0.; 
  float frequency = 2.;
  float gain = 1.;
  float thickness = .02;
  
  

  for( float i = 0.; i < 10.; i++ ) { 
    p.y += fract(-p.x *tan(p.y - time) * p.x+ p.y+ p.y);
    p.x-= mod(p.y, p.x);
    //color += (thickness / p.x);
    //color+= mod(p.x, p.y);
  }
   vec2 toCenter = vec2(0.1)+p*1.5;
   float angle = atan(toCenter.y,toCenter.y);
   float radius = length(toCenter);
   
   float v = clamp(cos(time + rand(1.) + 10.)*6., 5., 6.);
   
   vec3 t = hsv2rgb(vec3((angle/v),radius,1.0));
   
    for( float i = 0.; i < 10.; i++ ) { 
     
    t += mod(thickness / p.y, 2.);
    //t+= mod(p.x, p.y);
  }
  return gl_FragColor = vec4(t, 1.);
	//gl_FragColor = vec4(black, 1.0);
}




  vec4 blueGold(){
  vec2 p = uv();
  float color = 0.; 
  float frequency = 2.;
  float gain = 1.;
  float thickness = .015;

  for( float i = 0.; i < 10.; i++ ) { 
    p.x += cos( p.y + time) * gain * kale(vec2(p), PI); 
    color += sin( thickness / p.x );
  }
  
 //circle(p.x,p.y, 100., 0.);
    kale(vec2(p), PI);

  return gl_FragColor = vec4(vec2(color), rand(.4), .5);
  //blue gold side to side wave
  }


  vec4 flamingWater () {
    
  vec2 p = uv();
  //float color = 0.; 
  float frequency = 2.;
  float gain = 1.;
  float thickness = .02;
  
  
    
  for( float i = 0.; i < 10.; i++ ) { 
    //p.y += fract(-p.x *(p.y - time) * p.x+ p.y); //1
    p.y += fract(-p.x *tan(p.y - time) * p.x+ p.y+ p.y); //2
    //p.x -= mod(p.y, p.x);
    //p.x *= mod(p.y, p.x); //4
    
    //color += (thickness / p.x);
    //color+= mod(p.x, p.y);
  }
   vec2 toCenter = vec2(0.1)+p*bands[2];
   float angle = atan(toCenter.y,toCenter.y);
   float radius = length(toCenter);
   
   float v = clamp(sin(time + noise(1.))*6., .52, .51); //1
  v = clamp(cos(time + bands[2] + 10.)*6., 1., 1.5); //3
   
    vec3 t = hsv2rgb(vec3((angle/v),radius,1.0));
   
    for( float i = 0.; i < 10.; i++ ) { 
     
    t += mod(thickness / p.y, 1.);
    //t+= mod(p.x, p.y);
    vec3 color = vec3(0.);
    color = vec3(p.x,p.y,abs(sin(time))); //5
    p.x += cos( p.y + time) * gain * kale(vec2(p), PI); //5 
    
  }
  
  gl_FragColor = vec4(t, 1.);
  gl_FragColor = vec4(vec2(t), p.y/p.x, 1.); //last
	//gl_FragColor = vec4(black, 1.0);

  return gl_FragColor;
}

gl_FragColor = vec4( 
        gl_FragCoord.x / resolution.x, 
        gl_FragCoord.y / resolution.y, 
        mod( time/100., 1. ), 
        1.0 
      );