
* STAT 521: Lecture 10;

data one;
  input Age SBP @@;
  cards;
20	120	43	128
63	141	26	126
53	134	31	129
58	136	46	132
59	140	70	144
;

title 'Scatter plot of SBP vs age';
proc sgplot data=one;
  scatter x = age y = sbp;
  reg     x = age y = sbp;
run;

* Pearson correlation;
proc corr data=one;
  var age;
  with SBP;
run;

* Pearson correlation with 95% confidence interval;
proc corr data=one fisher(rho0=0.5 biasadj=no);
  var age;
  with SBP;
run;

* Sample size for Pearson rho;
proc power;
  onecorr dist=t
  corr   = 0.3
  ntotal =.
  power  = 0.8;
run;

* Spearman rank correlation;
proc corr data=one spearman;
  var age;
  with SBP;
run;

* Rank the data first;
proc rank data=one out=rank1;
 var Age SBP;
 ranks rAge rSBP;
run;
proc print data=rank1;
run;

* Calculate Pearson correlation on ranks;
* This should be identical to Spearman correlation;
proc corr data=rank1;
  var rAge;
  with rSBP;
run;
