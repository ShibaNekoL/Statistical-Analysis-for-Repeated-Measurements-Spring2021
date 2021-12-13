
/*  Example of Poisson regression  */
/*  n represents the number of insurance policyholders  */
/*  c represents the number of insurance claims  */
/*  car is the type of car involved (classified into three groups)  */
/*  age is the age group of a policyholder (classified into two groups, 1: younger, 2: elder)  */

data insure; 
   input n c car$ age; 
   ln = log(n); 
   datalines; 
500   42  small  1 
1200  37  medium 1 
100    1  large  1 
400  101  small  2 
500   73  medium 2 
300   14  large  2 
; 
run; 
 
proc genmod data=insure; 
   class car (ref="large") age (ref="1") / param=ref; 
   model c = car age / dist = poisson  link = log  offset = ln; 
run; 
 
/* Given the significance level = 0.05 */
/* (1) Please write down the statistical model.  */
/* (2) According to the deviance statistic, is the model fitted well?  */
/* (3) Please explain the regression coefficients that are statistically significant. */
