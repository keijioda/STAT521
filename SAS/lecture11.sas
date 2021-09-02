
* STAT 521: Lecture 11;

data one;
  input Age SBP @@;
  cards;
20	120	43	128
63	141	26	126
53	134	31	129
58	136	46	132
59	140	70	144
;

* Run regression;
proc reg data=one;
  model SBP = Age;
run;

* By matrix algebra;
proc iml;
  use one;
  read all into data;
  Y     = data[,2];
  X     = j(10,2,1);
  X[,2] = data[,1];
  Beta  = inv(X` * X) * X` * Y;
  print Beta;
run; 

* Confidence interval of betas;
proc reg data=one;
  model SBP = Age /clb;
run;

* Confidence/prediction interval for Y;
proc reg data=one;
  model SBP = Age;
  output out=out p=fitted 
         lclm=lower_CI uclm=upper_CI     /* 95% CI */
         lcl=lower_PI  ucl=upper_PI;     /* 95% PI */
run;
proc print data=out; run;

data add_this;
  Age = 55;
run;
data new;
  set one add_this;
run;
proc reg data=new;
  model SBP = Age;
  output out=out p=fitted 
         lclm=lower_CI uclm=upper_CI     /* 95% CI */
         lcl=lower_PI  ucl=upper_PI;     /* 95% PI */
run;
proc print data=out; run;

* Show ODS graphics;
proc reg data=one;
  model SBP = Age;
run;

* Residual plot;
proc reg data=one;
  model SBP = Age;
  plot r. * p.;      * Residual plot;
  plot r. * npp.;    * Normal prob plot;
run;

proc reg data=one;
  model SBP = Age;
  plot student. * p.;  * Studentized Residual;
  output out=out1 p=fitted
         r=residual 
         stdr=SE_resid
         student=studresid;
run;
proc print data=out1;
  sum residual;
run;
