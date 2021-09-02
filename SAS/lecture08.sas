
* STAT 521: Lecture 8;

data iron;
  input fibro iron;
  cards;
0      16.2
0      21.2
0      13.9
0      27.9
0      14.4
0      22.9
0      14.3
0      26.8
0      12.6
1      17.0
1      15.4
1      12.0
1      12.9
1       3.8
1      16.1
1      14.2
1      19.2
1      22.4
1       2.5
1       4.8
1       6.2
1       8.2
;

* Label for a grouping variable;
proc format;
  value fibro 0 = "Healthy"
              1 = "C.Fibrosis"
;
run;

* Produce box plots;
proc sgplot data=iron;
  format fibro fibro.;
  vbox iron / group = fibro;
run;

* Two-sample t-test;
proc ttest data=iron;
  format fibro fibro.;
  class fibro;
  var iron;
run;

data aortic;
  input subject $ stiffness;
  cards;
Hypertension    16.82
Hypertension    21.43
Hypertension    12.82
Hypertension    27.35
Hypertension    14.57
Hypertension    20.21
Hypertension    15.18
Hypertension    28.67
Hypertension    11.30
Hypertension    23.41
Hypertension    22.10
Hypertension    19.38
Hypertension    20.08
Hypertension    12.17
Hypertension    21.92
Normal           9.69
Normal          12.10
Normal          12.11
Normal           6.17
Normal           7.60
Normal           8.38
Normal           9.37
Normal          10.08
Normal          12.14
Normal          11.25
Normal          10.56
Normal           9.97
Normal          11.65
Normal          11.26
Normal           7.84
Normal           9.89
Normal          11.62
Normal           1.68
Normal          12.20
Normal           6.39
Normal           9.53
Normal          11.74
Normal          11.32
Normal           4.06
Normal          12.37
Normal          12.04
Normal           9.56
Normal           8.43
Normal           4.86
Normal          10.15
;

* Produce box plots;
proc sgplot data=aortic;
  vbox stiffness / group = subject;
run;

* Two-sample t-test;
proc ttest data=aortic;
  class subject;
  var stiffness;
run;

data LDL;
  input CornFlake OatBran;
  cards;
4.61	3.84
6.42	5.57
5.40	5.85
4.54	4.80
3.98	3.68
3.82	2.96
5.01	4.41
4.34	3.72
3.80	3.49
4.56	3.84
5.35	5.26
3.89	3.73
2.25	1.84
4.24	4.41
; 

* Paired t-test (two-tailed);
proc ttest data=LDL;
  paired CornFlake * OatBran;
run;

* Paired t-test (right-tailed);
proc ttest data=LDL sides=upper;
  paired CornFlake * OatBran;
run;

* Unequal variances, equal sample size;
proc power;
  twosamplemeans test=diff_satt	 /* use test = diff_satt for unequal variance */
  meandiff  = 10                 /* Mean difference */
  groupstds = (15 18)            /* SDs for two groups */
  power     = 0.8
  npergroup =.;
  plot y = power min = 0.7 max = 1;
run;

* Equal variances, equal sample size;
proc power;
  twosamplemeans test=diff 	     /* use test = diff for equal variance */
  meandiff  = 10                 /* Mean difference */
  stddev    = 17                 /* Common SD: sqrt(289) = 17 */
  power     = 0.8
  npergroup =.;
  plot y = power min = 0.7 max = 1;
run;

* Equal variances, unbalanced sample size;
proc power;
  twosamplemeans test=diff 	     /* use test = diff for equal variance */
  meandiff  = 10                 /* Mean difference */
  stddev    = 17                 /* Common SD: sqrt(289) = 17 */
  power     = 0.8
  groupweights = (1 2)           /* Sample size weights */
  ntotal =.;                     /* N total*/
  plot y = power min = 0.7 max = 1;
run;

* Solving for power, equal variances, unbalanced sample size;
proc power;
  twosamplemeans test=diff 	     /* use test = diff for equal variance */
  meandiff  = 10                 /* Mean difference */
  stddev    = 17                 /* Common SD: sqrt(289) = 17 */
  power     = .
  groupweights = (1 2)           /* Sample size weights */
  ntotal = 90;                   /* N total is 30 + 60 = 90 */
run;

* Sample size for paired t-test;
proc power;
  pairedmeans test=diff
  sides      = 1        /* one-tailed test*/
  meandiff   = 20
  corr       = 0.5      /* Correlation between pairs */
  pairedstds = (40 32)  /* Paired SDs */ 
  power      = 0.8
  npairs     =.;
run;
