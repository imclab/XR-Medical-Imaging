// DNA backbone model v3 2016  mkuiper
// openSCAD model for building DNA set.
//                            
// To generate pieces, uncomment out lines at the end of this script. 
// 
// Please send any comments or suggestions to 
// kuiper dot mike at gmail dot com  


// variables: atom radii:-------------------------------------------------
 nr=11;   // nitrogen
 cr=11;   // carbon
 or=11;   // oxygen
 pr=14;   // phosphorus
 hr=7.5;  // hydrogen


// magnet flag: set to "1" if you want to build with magnets, 
// else set to "0" for pins
 mag = 0;  

// h-bond pin dimensions 
 hbp = 3.2;    // radius of h-bond pin  - use these values for regular pins.
 hbh = 3.6;    // radius of h-bond hole

// hbp = 2.4;  // radius of h-bond pin -this works for 2 x 5mm cylindrical magnets
// hbh = 2.4;  // radius of h-bond hole

// pin dimensions:--------------------------------------------------------
 p1 =  6.0;    // radius of base pin
 pp =  6.4;    // radius of base pin 'knob'
 bph = 6.2;    // radius of base pin hole
 bpk = 6.5;    // radius of base pin 'knob' hole

 p2  = 6.5;    // radius of backbone pin
 p3  = 6.7;    // radius of backbone pin hole
 p4  = 7.05;   // radius of backbone pin 'knob'
 p5  = 7.2;    // radius of backbone pin 'knob' hole
 sp  = 2.4;    // thickness of split in pin

// backbone coordinates:--------------------------------------------------
module backbone(){
// translate([     0.0,     0.0,     0.0]) sphere(   nr);
union(){
 translate([    15.0,     0.0,     0.0]) sphere(   cr);
 translate([    20.0,     0.0,   14.14]) sphere(   cr);
 translate([   32.37,   -8.47,   13.62]) sphere(   cr);
 translate([   29.18,  -18.91,    3.33]) sphere(   cr);
 translate([   18.14,  -13.49,   -3.76]) sphere(   or);
 translate([   22.08,  -30.39,    9.89]) sphere(   cr);
 translate([   12.99,  -25.17,   20.62]) sphere(   or);
 translate([   44.02,   -0.05,    9.36]) sphere(   or);
 translate([   12.42,  -35.66,   32.69]) sphere(   pr);
//translate([   10.04,  -50.54,   27.31]) sphere(   or);
 translate([   26.54,  -35.91,   40.22]) sphere(   or);
 translate([   -0.38,  -32.62,    41.8]) sphere(   or);
 translate([   17.45,    5.64,   -3.34]) sphere(   hr);
 translate([   15.17,   -2.86,   18.32]) sphere(   hr);
 translate([    21.5,    6.55,   16.09]) sphere(   hr);
 translate([   33.53,   -11.3,   19.92]) sphere(   hr);
 translate([   35.09,  -21.02,    0.24]) sphere(   hr);
 translate([    18.3,  -33.83,    5.11]) sphere(   hr);
 translate([   26.78,  -34.74,   12.71]) sphere(   hr);
// translate([    45.1,   13.58,   14.75]) sphere(   hr);
//pin
 hull(){
//   translate([    44.1,   13.58,   17.75]) sphere( p2);
  translate([    45.1,   13.58,   14.75]) sphere( p2);
  translate([   44.02,   -0.05,    9.36]) sphere( p2);
  }
 translate([   45.1,   13.58,   14.75]) sphere( p4);
}
}

module phosphate(){
 translate([   12.99,  -25.17,   20.62]) sphere(   or);
 translate([   12.42,  -35.66,   32.69]) sphere(   pr);
//translate([   10.04,  -50.54,   27.31]) sphere(   or);
 translate([   26.54,  -35.91,   40.22]) sphere(   or);
 translate([   -0.38,  -32.62,    41.8]) sphere(   or);
}
module P(){
 difference(){
 phosphate();
 hull(){
  translate([   12.42,  -35.66,   32.69]) sphere( p3 );
  translate([ 10.04,  -50.54,   27.31]) sphere( p3 );
 }
 translate([   10.04,  -50.54,   27.31]) sphere(   or);
// pin hole
 translate([   12.42,  -35.66,   32.69]) sphere( p4);
 }
}
module O(){
 difference(){
  union(){
   hull(){
    translate([    45.1,   13.58,   14.75]) sphere( p2);
    translate([   44.02,   -0.05,    9.36]) sphere( p2);
   }
   translate([   44.02,   -0.05,    9.36]) sphere(   or);
   translate([   45.1,   13.58,   14.75]) sphere( p4);
  }
  translate([    45.1,   13.58,   14.75]) rotate([0,90,-5])
  cylinder( sp,10,10,center =true);
 }
}
module bb(){
 difference(){ 
  backbone();
  translate([  -0.25,     1.7,     0.0]) sphere( nr );
  translate([   10.04,  -50.54,   27.31])sphere( or + 0.1 );
  hull(){
   translate([ -0.25,  1.7,  0.0]) sphere( bph );
   translate([ 15.0,   0.0,  0.0]) sphere( bph );
  }
  translate([ 15.0,   0.0,  0.0]) sphere( bpk );
  hull(){
   translate([ 12.42, -35.66, 32.69]) sphere( p3 );
   translate([ 10.04, -50.54, 27.31]) sphere( p3 );
  }
// pin hole
  translate([ 12.42, -35.66, 32.69]) sphere( p5);
// pin split
  translate([    45.1,   13.58,   14.75]) 
  rotate([0,90,-3.2])
  cylinder( sp,10,10,center =true);
 }
}

//========================================================================
// Adenosine coordinates:-------------------------------------------------
module Ade(){
//translate([     0.0,     0.0,     0.0]) sphere(   cr);
 translate([    15.0,     0.0,     0.0]) sphere(   nr);
 translate([   23.82,     0.0,   12.14]) sphere(   cr);
 translate([   38.08,    -0.0,     7.5]) sphere(   nr);
 translate([   38.08,    -0.0,    -7.5]) sphere(   cr);
 translate([   23.82,    -0.0,  -12.14]) sphere(   cr);
 translate([    20.7,    -0.0,  -26.81]) sphere(   nr);
 translate([   31.85,    -0.0,  -36.84]) sphere(   cr);
 translate([   46.11,    -0.0,  -32.21]) sphere(   nr);
 translate([   49.23,    -0.0,  -17.54]) sphere(   cr);
 translate([    63.5,    -0.0,   -12.9]) sphere(   nr);
 translate([   21.65,     0.0,   18.79]) sphere(   hr);
 translate([   30.39,    -0.0,  -43.69]) sphere(   hr);
 translate([    71.3,    -0.0,  -19.93]) sphere(   hr);
 translate([   65.68,    -0.0,   -2.63]) sphere(   hr);
 hull(){
  translate([     0.0,     0.0,     0.0]) sphere( p1);
  translate([    15.0,     0.0,     0.0]) sphere( p1);
 }
 translate([     0.0,     0.0,     0.0]) sphere( pp);
}
// h-bonds for adenosine:-------------------------------------------------
module hb_ade(r){
 hull(){
  translate([    71.3,    -0.0,  -19.93]) sphere( r);
  translate([   85.42,    -0.0,  -32.64]) sphere( r);
 }
}
// Thymine coordinates:---------------------------------------------------
module Thy(){
 translate([   60.23,    -0.0,  -44.92]) sphere(   hr);
 translate([   68.03,    -0.0,  -51.95]) sphere(   nr);
 translate([   64.92,    -0.0,  -66.62]) sphere(   cr);
 translate([   76.06,    -0.0,  -76.66]) sphere(   nr);
 translate([   90.33,    -0.0,  -72.02]) sphere(   cr);
 translate([   93.45,    -0.0,  -57.35]) sphere(   cr);
 translate([    82.3,    -0.0,  -47.31]) sphere(   cr);
 translate([   85.42,    -0.0,  -32.64]) sphere(   or);
 translate([  107.71,    -0.0,  -52.71]) sphere(   cr);
 translate([   50.65,    -0.0,  -71.26]) sphere(   or);
 translate([  111.97,    -0.0,  -58.27]) sphere(   hr);
 translate([  108.91,    5.72,  -48.86]) sphere(   hr);
 translate([  108.91,   -5.72,  -48.86]) sphere(   hr);
 translate([   96.00,    -0.0,  -78.0]) sphere(   hr);

//translate([   72.94,    -0.0,  -91.33]) sphere(   cr);
 hull(){
  translate([   76.06,    -0.0,  -76.66]) sphere( p1);
  translate([   72.94,    -0.0,  -91.33]) sphere( p1);
 }
 translate([   72.94,    -0.0,  -91.33]) sphere( pp);
}
// h-bonds for thymine:---------------------------------------------------
module hb_thy(r){
  hull(){
   translate([   62.46,    -0.0,  -46.93]) sphere( r);
   translate([   46.11,    -0.0,  -32.21]) sphere( r);
  }
}

// Uracil coordinates:---------------------------------------------------
module Ura(){
 translate([   60.23,    -0.0,  -44.92]) sphere(   hr);
 translate([   68.03,    -0.0,  -51.95]) sphere(   nr);
 translate([   64.92,    -0.0,  -66.62]) sphere(   cr);
 translate([   76.06,    -0.0,  -76.66]) sphere(   nr);
 translate([   90.33,    -0.0,  -72.02]) sphere(   cr);
 translate([   93.45,    -0.0,  -57.35]) sphere(   cr);
 translate([    82.3,    -0.0,  -47.31]) sphere(   cr);
 translate([   85.42,    -0.0,  -32.64]) sphere(   or);
 translate([  102,    -0.0,  -54.5]) sphere(   hr);
 translate([   50.65,    -0.0,  -71.26]) sphere(   or);
// translate([  111.97,    -0.0,  -58.27]) sphere(   hr);
// translate([  108.91,    5.72,  -48.86]) sphere(   hr);
// translate([  108.91,   -5.72,  -48.86]) sphere(   hr);
 translate([   96.00,    -0.0,  -78.0]) sphere(   hr);

//translate([   72.94,    -0.0,  -91.33]) sphere(   cr);
 hull(){
  translate([   76.06,    -0.0,  -76.66]) sphere( p1);
  translate([   72.94,    -0.0,  -91.33]) sphere( p1);
 }
 translate([   72.94,    -0.0,  -91.33]) sphere( pp);
}





// ADE modifications:-----------------------------------------------------
module A(){
if (mag == 1){
 difference(){
   Ade();
   hb_ade(hbp);
   hb_thy(hbh);
// split pin
   rotate([0,0,0]) cylinder( sp,10,10,center =true);
   }
}

if (mag==0){
  difference(){
    union(){
     Ade();
     hb_ade(hbp);
    }
    hb_thy(hbh);
// split pin
    rotate([0,0,0]) cylinder( sp,10,10,center =true);
   }
}
}

// THY modifications:-----------------------------------------------------
module T(){
if (mag==1) {
 difference(){
   Thy();
   hb_thy(hbp);
   hb_ade(hbh);
// split pin
   translate([   72.94,    -0.0,  -91.33])
   rotate([0,100,0]) cylinder( sp,10,10,center =true);
 }
}


if (mag==0){
 difference(){
    union(){
     Thy();
     hb_thy(hbp);
    }
   hb_ade(hbh);
// split pin
   translate([   72.94,    -0.0,  -91.33])
   rotate([0,100,0]) cylinder( sp,10,10,center =true);
  }
 }
}
// Ura modifications:-----------------------------------------------------
module U(){
if (mag==1) {
 difference(){
   Ura();
   hb_thy(hbp);
   hb_ade(hbh);
// split pin
   translate([   72.94,    -0.0,  -91.33])
   rotate([0,100,0]) cylinder( sp,10,10,center =true);
 }
}


if (mag==0){
 difference(){
    union(){
     Ura();
     hb_thy(hbp);
    }
   hb_ade(hbh);
// split pin
   translate([   72.94,    -0.0,  -91.33])
   rotate([0,100,0]) cylinder( sp,10,10,center =true);
  }
 }
}


// Guanine coordinates:---------------------------------------------------
module Gua(){
//translate([     0.0,     0.0,     0.0]) sphere(   cr);
 translate([    15.0,     0.0,     0.0]) sphere(   nr);
 translate([   23.82,     0.0,   12.14]) sphere(   cr);
 translate([   38.08,    -0.0,     7.5]) sphere(   nr);
 translate([   38.08,    -0.0,    -7.5]) sphere(   cr);
 translate([   23.82,    -0.0,  -12.14]) sphere(   cr);
 translate([    20.7,    -0.0,  -26.81]) sphere(   nr);
 translate([   31.85,    -0.0,  -36.84]) sphere(   cr);
 translate([   46.11,    -0.0,  -32.21]) sphere(   nr);
 translate([   49.23,    -0.0,  -17.54]) sphere(   cr);
 translate([    63.5,    -0.0,   -12.9]) sphere(   or);
 translate([   21.65,     0.0,   18.79]) sphere(   hr);
 translate([   28.73,    -0.0,  -51.52]) sphere(   nr);
 translate([   53.91,    -0.0,  -39.24]) sphere(   hr);
 translate([   36.53,    -0.0,  -58.54]) sphere(   hr);
 translate([   18.74,    -0.0,  -54.76]) sphere(   hr);
 hull(){
  translate([     0.0,     0.0,     0.0]) sphere( p1);
  translate([    15.0,     0.0,     0.0]) sphere( p1);
 }
 translate([     0.0,     0.0,     0.0]) sphere( pp);
}
// h-bonds for guanine:---------------------------------------------------
module hb_gua(r){
 hull(){
  translate([   53.91,    -0.0,  -39.24]) sphere( r);
  translate([   68.03,    -0.0,  -51.95]) sphere( r);
 }
 hull(){
  translate([   50.65,    -0.0,  -71.26]) sphere( r);
  translate([   36.53,    -0.0,  -58.54]) sphere( r);
 }
}

// GUA modifications:-----------------------------------------------------
module G(){
if (mag==1){
 difference(){
   Gua();
   hb_gua(hbp);
   hb_cyt(hbh);
// split pin
   rotate([0,0,0]) cylinder( sp,10,10,center =true);
 }
}

if (mag==0){
 difference(){
  union(){
   Gua();
   hb_gua(hbp);
  }
 hb_cyt(hbh);
// split pin
 rotate([0,0,0]) cylinder( sp,10,10,center =true);
 }
}
}

// Cytosine coordinates:--------------------------------------------------
module Cyt(){
 translate([   77.62,    -0.0,  -25.62]) sphere(   hr);
 translate([   85.42,    -0.0,  -32.64]) sphere(   nr);
 translate([    82.3,    -0.0,  -47.31]) sphere(   cr);
 translate([   68.03,    -0.0,  -51.95]) sphere(   nr);
 translate([   64.92,    -0.0,  -66.62]) sphere(   cr);
 translate([   76.06,    -0.0,  -76.66]) sphere(   nr);
 translate([   90.33,    -0.0,  -72.02]) sphere(   cr);
 translate([   93.45,    -0.0,  -57.35]) sphere(   cr);
 translate([   50.65,    -0.0,  -71.26]) sphere(   or);
//translate([   72.94,    -0.0,  -91.33]) sphere(   cr);
 translate([   95.53,    -0.0,  -76.71]) sphere(   hr);
 translate([   100.1,    -0.0,  -55.19]) sphere(   hr);
 translate([    95.4,    -0.0,   -29.4]) sphere(   hr);
 hull(){
  translate([   72.94,    -0.0,  -91.33]) sphere( p1);
  translate([   76.06,    -0.0,  -76.66]) sphere( p1);
 }
 translate([   72.94,    -0.0,  -91.33]) sphere( pp);
}
// h-bonds for cytosine:--------------------------------------------------
module hb_cyt(r){
 hull(){
  translate([    63.5,    -0.0,   -12.9]) sphere( r);
  translate([   77.62,    -0.0,  -25.62]) sphere( r);
 }
}

module MetCyt(){
translate([   77.62,    -0.0,  -25.62]) sphere(   hr);
translate([   85.42,    -0.0,  -32.64]) sphere(   nr);
translate([    82.3,    -0.0,  -47.31]) sphere(   cr);
translate([   68.03,    -0.0,  -51.95]) sphere(   nr);
translate([   64.92,    -0.0,  -66.62]) sphere(   cr);
translate([   76.06,    -0.0,  -76.66]) sphere(   nr);
translate([   90.33,    -0.0,  -72.02]) sphere(   cr);
translate([   93.45,    -0.0,  -57.35]) sphere(   cr);
translate([   50.65,    -0.0,  -71.26]) sphere(   or);
//translate([   72.94,    -0.0,  -91.33]) sphere(   cr);
translate([   95.53,    -0.0,  -76.71]) sphere(   hr);
translate([  107.71,    -0.0,  -52.71]) sphere(   cr);
translate([    95.4,    -0.0,   -29.4]) sphere(   hr);
translate([  113.19,    -0.0,  -59.86]) sphere(   hr);
translate([  109.25,    7.35,  -47.75]) sphere(   hr);
translate([  109.25,   -7.35,  -47.75]) sphere(   hr);
 hull(){
  translate([   72.94,    -0.0,  -91.33]) sphere( p1);
  translate([   76.06,    -0.0,  -76.66]) sphere( p1);
 }
 translate([   72.94,    -0.0,  -91.33]) sphere( pp);
}






// CYT base  modifications:-----------------------------------------------
module C(){
if (mag==1){
  difference(){
   Cyt();
   hb_cyt(hbp);
   hb_gua(hbh);
// split pin
  translate([   72.94,    -0.0,  -91.33]) rotate([0,103,0])
  cylinder( sp,10,10,center =true);
 }
}

if (mag==0){
 difference(){
  union(){
   Cyt();
   hb_cyt(hbp);
  }
  hb_gua(hbh);
// split pin
  translate([   72.94,    -0.0,  -91.33]) rotate([0,103,0])
  cylinder( sp,10,10,center =true);
 }
}
}
module mC(){
if (mag==1){
  difference(){
   MetCyt();
   hb_cyt(hbp);
   hb_gua(hbh);
// split pin
  translate([   72.94,    -0.0,  -91.33]) rotate([0,103,0])
  cylinder( sp,10,10,center =true);
 }
}

if (mag==0){
 difference(){
  union(){
   MetCyt();
   hb_cyt(hbp);
  }
  hb_gua(hbh);
// split pin
  translate([   72.94,    -0.0,  -91.33]) rotate([0,103,0])
  cylinder( sp,10,10,center =true);
 }
}
}



//=========================================================================
// Business end: uncomment out the piece you want to generate.  

$fn=48;
s = 0.45;  // scaling factor:

scale([s,s,s]){
translate([-10,20,47]) rotate([80,60,30])    bb();  // Backbone
// translate([-30,-10,0]) rotate([90,0,0])    A();  // Adenosine
// translate([-80,-60,0]) rotate([90,0,0])    T();  // Thymine
// translate([-80,-60,0]) rotate([90,0,0])      U();  // Uracil

// translate([-30,-20,0]) rotate([90,0,0])    G();  // Guanine
// translate([-80,-60,0]) rotate([90,0,0])    C();  // Cytosine
// translate([-80,-60,0]) rotate([90,0,0])    mC();  // Methylated Cytosine

// translate([-45,15,-3]) rotate([67,172,90]) P();  // Phosphate PO3 end cap
// translate([-45,-10,-5]) rotate([-20,0,5])  O();  // Phosphate O end cap
}

