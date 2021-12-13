
/* GEE analysis */
proc genmod data=wheeze descend; 
   class case city / param=ref; 
   model wheeze=city age smoke / dist=binomial; 
   repeated subject=case / type=ar(1) corrw covb; 
run; 

/* GLMM  R-side analysis */
proc glimmix data=wheeze empirical; 
   class case city; 
   model wheeze(descending)=city age smoke / dist=binomial s; 
   random residual / subject=case type=ar(1) vcorr; 
   covtest/wald;
run;

/* GLMM  G-side analysis */
proc glimmix data=wheeze empirical; 
   class case city; 
   model wheeze(descending)=city age smoke / dist=binomial s; 
   random intercept / subject=case vcorr s;
   covtest/wald;
run;


