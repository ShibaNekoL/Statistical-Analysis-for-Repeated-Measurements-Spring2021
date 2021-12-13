data pr; 
  input Person Gender $ y1 y2 y3 y4; 
  y=y1; Age=8;  output; 
  y=y2; Age=10; output; 
  y=y3; Age=12; output; 
  y=y4; Age=14; output; 
  drop y1-y4; 
  datalines; 
 1   F   21.0    20.0    21.5    23.0 
 2   F   21.0    21.5    24.0    25.5 
 3   F   20.5    24.0    24.5    26.0 
 4   F   23.5    24.5    25.0    26.5 
 5   F   21.5    23.0    22.5    23.5 
 6   F   20.0    21.0    21.0    22.5 
 7   F   21.5    22.5    23.0    25.0 
 8   F   23.0    23.0    23.5    24.0 
 9   F   20.0    21.0    22.0    21.5 
10   F   16.5    19.0    19.0    19.5 
11   F   24.5    25.0    28.0    28.0 
12   M   26.0    25.0    29.0    31.0 
13   M   21.5    22.5    23.0    26.5 
14   M   23.0    22.5    24.0    27.5 
15   M   25.5    27.5    26.5    27.0 
16   M   20.0    23.5    22.5    26.0 
17   M   24.5    25.5    27.0    28.5 
18   M   22.0    22.0    24.5    26.5 
19   M   24.0    21.5    24.5    25.5 
20   M   23.0    20.5    31.0    26.0 
21   M   27.5    28.0    31.0    31.5 
22   M   23.0    23.0    23.5    25.0 
23   M   21.5    23.5    24.0    28.0 
24   M   17.0    24.5    26.0    29.5 
25   M   22.5    25.5    25.5    26.0 
26   M   23.0    24.5    26.0    30.0 
27   M   22.0    21.5    23.5    25.0 
; 

/* R-side analysis */

proc mixed data=pr covtest; 
   class Person Gender (ref="F"); 
   model y=Gender Age / s; 
   repeated / subject=Person type=un rcorr; 
run;

proc glimmix data=pr; 
   class Person Gender (ref="F"); 
   model y = Gender Age /  dist=normal s; 
   random residual / subject=Person type=un vcorr; 
   covtest/wald;
run;

/* G-side analysis */

/* Random intercept model */

proc mixed data=pr covtest; 
   class Person Gender (ref="F"); 
   model y=Gender Age / s; 
   random intercept / subject=Person vcorr; 
run;

proc glimmix data=pr; 
   class Person Gender (ref="F"); 
   model y = Gender Age / dist=normal s; 
   random intercept / subject=Person vcorr;
   covtest/wald;
run;


/* Random intercept and random slope model */

proc mixed data=pr covtest; 
   class Person Gender (ref="F"); 
   model y=Gender Age / s; 
   random intercept age / subject=Person type=un vcorr; 
run;

proc glimmix data=pr; 
   class Person Gender (ref="F"); 
   model y = Gender Age / dist=normal s; 
   random intercept age / subject=Person type=un vcorr;
   covtest/wald;
run;

