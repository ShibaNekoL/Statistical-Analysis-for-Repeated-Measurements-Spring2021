
data multicenter; 
  input center group$ n sideeffect; 
  datalines; 
 1  A  32  14 
 1  B  33  18 
 2  A  30   4 
 2  B  28   8 
 3  A  23  14 
 3  B  24   9 
 4  A  22   7 
 4  B  22  10 
 5  A  20   6 
 5  B  21  12 
 6  A  19   1 
 6  B  20   3 
 7  A  17   2 
 7  B  17   6 
 8  A  16   7 
 8  B  15   9 
 9  A  13   1 
 9  B  14   5 
10  A  13   3 
10  B  13   1 
11  A  11   1 
11  B  12   2 
12  A  10   1 
12  B   9   0 
13  A   9   2 
13  B   9   6 
14  A   8   1 
14  B   8   1 
15  A   7   1 
15  B   8   0 
; 
  
/* GLM, aggregate data, individual data */
proc genmod data=multicenter; 
   class center group(ref="B") / param=ref; 
   model sideeffect/n = group / dist=binomial; 
run; 

