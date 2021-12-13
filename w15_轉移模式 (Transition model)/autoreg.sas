
proc sgplot data=autoreg;
	series x=time y=y;
	reg x=time y=y;
run;

proc autoreg data=autoreg;
	model y = time / method=ml;
run;

proc autoreg data=autoreg;
	model y = time / nlag=1 method=ml;
run;

proc autoreg data=autoreg;
	model y = time / nlag=2 method=ml;
run;

proc autoreg data=autoreg;
	model y = time / nlag=3 method=ml;
run;




