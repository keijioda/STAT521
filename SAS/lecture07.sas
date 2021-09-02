
* STAT 521: Lecture 7;

* Example 6: One-sample t-test;
data head;
  input circumference @@;
cards;
33.38 32.15 33.99 34.10 33.97
34.34 33.95 33.85 34.23 32.73
33.46 34.13 34.45 34.19 34.05
;

proc ttest data=head h0=34.5;
  var circumference;
run;

data baby;
  input wt @@;
  cards;
3.73	4.37	3.73	4.33	3.39	3.68	4.68	3.52
3.02	4.09	2.47	4.13	4.47	3.22	3.43	2.54
;

* Check if the data is normally distributed;
proc univariate data=baby normal;
  var wt;
  histogram;
  probplot/square;
run;

proc ttest h0=3.39;
  var wt;
run;

* Example 12;
* One-tailed test, solving for sample size;
proc power;
  onesamplemeans test=t
  sides    = 1           /* One-tailed */
  nullmean = 110         /* Population mean */
  mean     = 105         /* Expected mean   */
  stddev   = 25          /* sqrt(625) = 25 */
  alpha    = 0.05
  power    = 0.8
  ntotal   =.;
  plot y = power min = 0.7 max = 1;  * Power function;
run;

* Example 13;
* One-tailed test, solving for power;
proc power;
  onesamplemeans test=t
  sides    = 1           /* One-tailed */
  nullmean = 110         /* Population mean */
  mean     = 105         /* Expected mean   */
  stddev   = 25          /* sqrt(625) = 25 */
  alpha    = 0.05
  power    =.
  ntotal   = 130;        /* sample size available */
run;

* Example 14;
* Two-tailed test, solving for sample size;
proc power;
  onesamplemeans test=t
  sides    = 2           /* Two-tailed */
  nullmean = 110         /* Population mean */
  mean     = 105         /* Expected mean   */
  stddev   = 25          /* sqrt(625) = 25 */
  alpha    = 0.05
  power    = 0.8 0.85 0.9
  ntotal   =.;
  plot y = power min = 0.7 max = 1;  * Power function;
run;

proc power;
  onesamplemeans test=t
  sides    = 2           /* Two-tailed */
  nullmean = 110         /* Population mean */
  mean     = 115 118     /* Expected mean   */
  stddev   = 20 25 30
  alpha    = 0.05
  power    = 0.8 0.85 0.9
  ntotal   =.;
  plot y = power min = 0.7 max = 1 key = bycurve;
run;

* Example 17;
* One-sample test for proportion;
proc power;
  onesamplefreq test=z method=normal
  sides = 1              /* One-tailed */
  nullproportion = 0.3   /* p0 */
  proportion = 0.2       /* p1 */
  power = 0.8
  ntotal =.;
run;
