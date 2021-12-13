
proc genmod data=wheeze descend; 
   class case city / param=ref; 
   model wheeze=city age smoke / dist=binomial; 
   repeated subject=case / corrw covb corr=ind; 
run; 

proc genmod data=wheeze descend; 
   class case city / param=ref; 
   model wheeze=city age smoke / dist=binomial; 
   repeated subject=case / corrw covb corr=exch; 
run; 

proc genmod data=wheeze descend; 
   class case city / param=ref; 
   model wheeze=city age smoke / dist=binomial; 
   repeated subject=case / corrw covb corr=ar(1); 
run; 

proc genmod data=wheeze descend; 
   class case city / param=ref; 
   model wheeze=city age smoke / dist=binomial; 
   repeated subject=case / corrw covb corr=unstr; 
run; 

