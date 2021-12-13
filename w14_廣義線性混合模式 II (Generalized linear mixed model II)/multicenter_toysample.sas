
/* GLM --- Binomial distribution (individual data) */

data multicenter; 
  input center group$ sideeffect; 
  datalines; 
13  A   1
13  A   1
13  A   0
13  A   0
13  A   0
13  A   0
13  A   0
13  A   0
13  A   0
13  B   1 
13  B   1 
13  B   1 
13  B   1 
13  B   1 
13  B   1 
13  B   0 
13  B   0 
13  B   0 
14  A   1 
14  A   0 
14  A   0 
14  A   0 
14  A   0 
14  A   0 
14  A   0 
14  A   0 
14  B   1 
14  B   0
14  B   0
14  B   0
14  B   0
14  B   0
14  B   0
14  B   0
15  A   1 
15  A   0 
15  A   0 
15  A   0 
15  A   0 
15  A   0 
15  A   0 
15  B   0 
15  B   0 
15  B   0 
15  B   0 
15  B   0 
15  B   0 
15  B   0 
15  B   0 
; 
  
proc genmod data=multicenter descend; 
   class center group (ref="B") / param=ref; 
   model sideeffect = group / dist=binomial;   /* Bernoulli distribution = Binomial distribution (n=1) */
run; 

/* GLM --- Binomial distribution (aggregated data) */
data multicenter; 
  input center group$ n sideeffect; 
  datalines; 
13  A   9   2 
13  B   9   6 
14  A   8   1 
14  B   8   1 
15  A   7   1 
15  B   8   0 
; 
  
proc genmod data=multicenter; 
   class center group (ref="B") / param=ref; 
   model sideeffect/n = group / dist=binomial; 
run; 

