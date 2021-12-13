data d1;
input year py deaths sex $ @@;
spy = py/100000;   /* standardized person years */
o = log(spy);
rate = deaths/spy;
datalines;
1 1299868 55 m 1 1300402 37 f
2 1240595 49 m 2 1217896 29 f
3 1045453 38 m 3 1045801 23 f
4 795776 26 m 4 810260 12 f
5 645991 19 m 5 665612 7 f
6 599729 17 m 6 633646 12 f
7 568109 22 m 7 650686 9 f
8 506475 21 m 8 600455 19 f
9 368751 18 m 9 474609 13 f
10 252581 11 m 10 376781 14 f
11 140053 10 m 11 255412 5 f
12 81850 4 m 12 213603 3 f
;
run;

proc format;
 value yearf 1='30-34' 2='35-39' 3='40-44' 4='45-49'
 5='50-54' 6='55-59' 7='60-64' 8='65-69'
 9='70-74' 10='75-79' 11='80-84' 12='85+';
run;

proc sort data = d1;
  by sex;
run;

proc print;
  var year py deaths rate sex;
  format year yearf.;
  symbol1 color=red interpol=join value=1 height=1;
  symbol2 color=blue interpol=join value=2 height=1;
run;

proc gplot;
  plot rate*year = sex;
run;

/* Homework: */
/* (1) Please write down the statistical model.  */
/* (2) According to the deviance statistic, is the model fitted well?  (given significance level = 0.05). */
/* (3) Please explain the regression coefficients that are statistically significant (given significance level = 0.01). */


proc genmod data=d1; 
   class year (ref="5") sex (ref="f") / param=ref; 
   model deaths = year sex / dist = poisson  link = log  offset = o; 
run; 


/* Because Poisson distribution is used to model count data, we CANNOT fit the model with the following code. */
proc genmod data=d1; 
   class year (ref="5") sex (ref="f") / param=ref; 
   model rate = year sex / dist = poisson  link = log ; 
run; 

/* GLM model */
proc genmod data=new;
class id;
model y=bline trt age / d=poisson offset=ltime;
run;

/* GEE model */
proc genmod data=new;
class id;
model y=bline trt age / dist=poisson offset=ltime;
repeated subject=id / type=exch corrw covb;
run;
