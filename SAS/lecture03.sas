
* STAT 521: Lecture 3;

* CDF of N(0,1);
* Change the z-score as you wish;
data one;
  z = 1.96;
  prob = probnorm(z);
run;
proc print noobs;run;
