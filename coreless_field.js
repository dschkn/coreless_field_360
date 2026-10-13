/* Coreless Field / 360 v0.5 -- Max js (ES5), Jitter visualization + preview gains.
   All speaker locations are static unless count/layout is changed.
   Matrix allocation happens only at initialization / count changes.
   This is an angular preview panner, NOT a VBAP implementation. The visual field is an artistic geometry, NOT a magnetic simulation. */
autowatch = 1;
inlets = 1;
outlets = 11;
var TAU=2*Math.PI, N=36, phase=0, speed=0.012, width=0.48, deformation=0.55, pieceTime=0, playing=1;
var RINGS=[{el:90,n:1},{el:67,n:7},{el:39,n:10},{el:0,n:10},{el:-22,n:8}]; // 36; provisional room geometry
var speakers=[], lines=3, steps=90, sides=6, matrixLines=null, matrixSpeakers=null, matrixHead=null, matrixPath=null, matrixActivity=null;
var totalSegments=lines*steps*sides*2;
function clamp(x,a,b){return Math.max(a,Math.min(b,x));}
function unit(x,y,z){var k=Math.sqrt(x*x+y*y+z*z)||1;return [x/k,y/k,z/k];}
function put(m,i,p){m.setcell1d(i,p);}
function initMatrices(){matrixLines=new JitterMatrix(3,'float32',totalSegments*2);matrixSpeakers=new JitterMatrix(3,'float32',N);matrixHead=new JitterMatrix(3,'float32',1);matrixPath=new JitterMatrix(3,'float32',256);matrixActivity=new JitterMatrix(3,'float32',40*6*2);}
function speakerPos(az,el){var a=az*Math.PI/180,e=el*Math.PI/180,c=Math.cos(e);return [1.47*c*Math.sin(a),1.47*Math.sin(e),1.47*c*Math.cos(a)];}
function build(){speakers=[];var remaining=N, ringcount=RINGS.length, counts=[], i,j;
  if(N===2){counts=[0,0,0,2,0];}else{
    var weights=[1,7,10,10,8],sum=36;
    for(i=0;i<5;i++)counts[i]=Math.floor(N*weights[i]/sum);
    if(N>=5){for(i=0;i<5;i++)counts[i]=Math.max(1,counts[i]);}
    var t=0;for(i=0;i<5;i++)t+=counts[i];
    while(t<N){counts[3]++;t++;}
    while(t>N){for(i=4;i>=0&&t>N;i--)if(counts[i]>(N>=5?1:0)){counts[i]--;t--;}}
  }
  for(i=0;i<5;i++)for(j=0;j<counts[i];j++){
    var az=(j/counts[i]*360)+(i%2?360/(2*counts[i]):0);
    speakers.push(speakerPos(az,RINGS[i].el));
  }
  initMatrices();for(i=0;i<N;i++)put(matrixSpeakers,i,speakers[i]);
  outlet(0,'jit_matrix',matrixSpeakers.name);outlet(5,'layout',N);
}
/* Ribbon/tube centreline: three-dimensional folded lobes, not a sphere. */
function center(u,k,t){var a=TAU*u, q=TAU*k/lines, bend=deformation;
 var x=0.62*Math.cos(2*a+q)+0.32*Math.cos(5*a-q*0.5+t*0.65)+bend*0.23*Math.sin(7*a+q+t*0.75);
 var y=0.21+0.53*Math.sin(3*a+q*0.64)+0.27*Math.cos(4*a-q+t*0.54)+bend*0.16*Math.sin(9*a+q);
 var z=0.63*Math.sin(2*a+q)+0.30*Math.sin(5*a+q+t*0.5)+bend*0.23*Math.cos(7*a-q+t*0.58);
 return [0.83*x,0.80*y,0.83*z];
}
function ring(u,k,t){var p=center(u,k,t), b=center(u+0.001,k,t), tangent=unit(b[0]-p[0],b[1]-p[1],b[2]-p[2]);
 var helper=Math.abs(tangent[1])>0.90?[1,0,0]:[0,1,0];
 var ax=unit(tangent[1]*helper[2]-tangent[2]*helper[1],tangent[2]*helper[0]-tangent[0]*helper[2],tangent[0]*helper[1]-tangent[1]*helper[0]);
 var bx=[tangent[1]*ax[2]-tangent[2]*ax[1],tangent[2]*ax[0]-tangent[0]*ax[2],tangent[0]*ax[1]-tangent[1]*ax[0]];
 var out=[],radius=0.115+0.035*Math.sin(TAU*5*u+2*k+t*0.62);
 for(var i=0;i<sides;i++){var w=TAU*i/sides;out.push([p[0]+radius*(Math.cos(w)*ax[0]+Math.sin(w)*bx[0]),p[1]+radius*(Math.cos(w)*ax[1]+Math.sin(w)*bx[1]),p[2]+radius*(Math.cos(w)*ax[2]+Math.sin(w)*bx[2])]);}
 return out;
}
function bang(){if(!matrixLines)build();phase+=speed; if(playing)pieceTime=Math.min(900,pieceTime+0.05);var idx=0,k,i,j,prev,curr,first;
 for(k=0;k<lines;k++){
  prev=ring(0,k,phase);first=prev;
  for(i=0;i<steps;i++){
    curr=ring((i+1)/steps,k,phase);
    for(j=0;j<sides;j++){
      put(matrixLines,idx++,prev[j]);put(matrixLines,idx++,curr[j]);
      put(matrixLines,idx++,prev[j]);put(matrixLines,idx++,prev[(j+1)%sides]);
    }
    prev=curr;
  }
 }
 // Fixed-duration 15-minute score: elevation from floor to zenith, then a descent.
 // Preview timeline advances only while RUN emits bangs; reset restarts the score.
 var t=pieceTime, az,el,frequency,brightness;
 if(t<120){el=-22;az=-120+0.65*t;frequency=47+0.012*t;brightness=0.55;}
 else if(t<300){el=-22+112*(t-120)/180;az=-42+1.3*(t-120);frequency=48.5+20*(t-120)/180;brightness=0.72;}
 else if(t<420){el=87+3*Math.sin(t*0.10);az=192+0.3*(t-300);frequency=68+0.012*(t-300);brightness=0.6;}
 else if(t<600){el=90-112*(t-420)/180;az=225+1.1*(t-420);frequency=69.5-19*(t-420)/180;brightness=0.83;}
 else if(t<735){el=8+35*Math.sin((t-600)*0.061);az=423+1.9*(t-600);frequency=52+5*Math.sin(t*0.038);brightness=0.85;}
 else {el=-22+8*Math.sin((t-735)*0.021)*((900-t)/165);az=679+0.17*(t-735);frequency=48-(t-735)*0.006;brightness=0.46;}
 var ar=az*Math.PI/180, er=el*Math.PI/180;
 // Spatial sound path is decoupled from the decorative tubular mesh.
 var direction=[Math.cos(er)*Math.sin(ar),Math.sin(er),Math.cos(er)*Math.cos(ar)];
 var head=[direction[0]*1.27,direction[1]*1.27,direction[2]*1.27];
 for(i=0;i<256;i++){
  var lag=i/255*62;
  var pa=ar-lag*0.018, pe=er+0.12*Math.sin(i*0.03+phase);
  put(matrixPath,i,[1.24*Math.cos(pe)*Math.sin(pa),1.24*Math.sin(pe),1.24*Math.cos(pe)*Math.cos(pa)]);
 }
 put(matrixHead,0,head);
 outlet(9,frequency);outlet(10,frequency+0.37+0.21*Math.sin(t*0.017));
 outlet(5,'score',Math.floor(t/60)+'m'+Math.floor(t%60)+'s','elev',Math.round(el),'Hz',frequency.toFixed(2));
 var hd=direction,gain=[],power=0,maximum=0,active=0;
 for(i=0;i<N;i++){
  var s=speakers[i],d=clamp((s[0]*hd[0]+s[1]*hd[1]+s[2]*hd[2])/1.47,-1,1);
  var angle=Math.acos(d),g=Math.exp(-0.5*Math.pow(angle/width,2));gain.push(g);power+=g*g;
 }
 power=Math.sqrt(power)||1;
 for(i=0;i<N;i++){gain[i]/=power;if(gain[i]>maximum){maximum=gain[i];active=i+1;}}
 outlet(0,'jit_matrix',matrixSpeakers.name);
 outlet(1,'jit_matrix',matrixLines.name);
 outlet(2,'jit_matrix',matrixPath.name);
 outlet(3,'jit_matrix',matrixHead.name);
 // mc.list~ accepts a flat list, one signal constant per channel.
 // Animated speaker activity marks: 3-axis wire stars grow with level.
 var e=0;
 for(i=0;i<40;i++){
  var pos=i<N?speakers[i]:[0,-30-i,0],rr=i<N?(0.025+0.13*gain[i]):0;
  for(j=0;j<3;j++){
   var a1=[pos[0],pos[1],pos[2]],b1=[pos[0],pos[1],pos[2]];
   a1[j]-=rr;b1[j]+=rr;
   put(matrixActivity,e++,a1);put(matrixActivity,e++,b1);
  }
 }
 outlet(6,'jit_matrix',matrixActivity.name);
 while(gain.length<40)gain.push(0);
 outlet(4,gain);
 // Stereo audition retains azimuth rather than summing arbitrary channel indices.
 // Constant-power weighting of each speaker by its physical left-right position.
 var l=[],r=[];
 for(i=0;i<40;i++){
   var az=i<N?speakers[i][0]/1.47:0;
   var pan=clamp(0.5+0.5*az,0,1);
   l.push(gain[i]*Math.sqrt(1-pan));
   r.push(gain[i]*Math.sqrt(pan));
 }
 outlet(7,l);
 outlet(8,r);
 outlet(5,'activity',active,maximum);
}
function setcount(v){N=clamp(Math.round(v),2,40);build();}
function setspeed(v){speed=clamp(v,0,0.05);}
function setwidth(v){width=clamp(v,0.08,1.5);}
function setdeform(v){deformation=clamp(v,0,1.8);}
function reset(){phase=0;pieceTime=0;}
function settime(v){pieceTime=clamp(v,0,900);}
function play(v){playing=Number(v)!==0;}
function loadbang(){build();}