
proc mixed data=growth covtest; 
   class id Gender (ref="2"); 
   model weight=Gender Age brthwtkg Age*Age / s residual influence(effect=id iter=10) outp=prout; ; 
   repeated / subject=id R type = ar(1) rcorr; 
run;

data new;
  set growth;
  if id=1155 then delete;
run;

proc mixed data=new covtest; 
   class id Gender (ref="2"); 
   model weight=Gender Age brthwtkg Age*Age / s residual influence(effect=id iter=10) outp=prout; ; 
   repeated / subject=id R type = ar(1) rcorr; 
run;
 
proc univariate data=prout normal;
	var Resid StudentResid PearsonResid;
run;


data growth;
  set growth;
  lnweight=log(weight);
  run;

proc mixed data=growth covtest; 
   class id Gender (ref="2"); 
   model lnweight=Gender Age brthwtkg Age*Age / s residual influence(effect=id iter=10) outp=prout; ; 
   repeated / subject=id R type = ar(1) rcorr; 
run;

proc univariate data=prout normal;
	var Resid StudentResid PearsonResid;
run;
