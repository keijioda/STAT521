
* STAT 521: Lecture 9;

* One-way ANOVA;
data one;
  input group y @@;
  cards;
1 25	1 30	1 35	1 40	1 40	1 45	1 50	1 55
2 35	2 40	2 45	2 50	2 50	2 55	2 60	2 65
3 45	3 50	3 55	3 60	3 60	3 65	3 70	3 75
; 
proc anova data=one;
  class group;
  model y = group;
  means group /hovtest;
run; quit;

* Confidence interval for factor level means;
proc anova data=one;
  class group;
  model y = group;
  means group /clm t alpha=.05;
run; quit;

* Confidence interval for differences of factor level means;
proc anova data=one;
  class group;
  model y = group;
  means group /cldiff t alpha=.05;
run; quit;

* Multiple comparisons by Tukey's HSD and Bonferroni;
proc anova data=one;
  class group;
  model y = group;
  means group /cldiff tukey bon scheffe;
run; quit;

* Power analysis for one-way ANOVA;
data one;
  alpha = 0.05;        * Alpha level;
  ncp   = 11.2;        * Noncentral parameter;
  df1   = 2;           * Numerator df;
  df2   = 27;          * Denominator df;
  CV    = FINV(1-alpha, df1, df2);  * Critical value;
  Power = 1 - probf(CV, df1, df2, ncp);
run;
proc print noobs;run;

* One-way ANOVA, solving for power;
proc power;
   onewayanova test=overall   /* one-way ANOVA     */
   groupmeans = 12 | 15| 18   /* estimated means   */
   stddev = 4                 /* sqrt(16) = 4      */
   npergroup = 10             /* equal sample size */
   power =.;
run;

* Solving for sample size (per group);
proc power;
   onewayanova test=overall   /* one-way ANOVA     */
   groupmeans = 12 | 15| 18   /* estimated means   */
   stddev = 4                 /* sqrt(16) = 4      */
   power = 0.8
   npergroup =.;
run;
