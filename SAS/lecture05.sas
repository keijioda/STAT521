
* STAT 521: Lecture 5;

* Understanding Confidence Intervals;

*************************************************;
* 1) Set up a hypothetical population
*************************************************;

* Randomly produce 10,000 values from a right-skewed distribution;
data population;
  do id = 1 to 10000;
    x = ranexp(123) * 20 + 20; output;
  end;
run;

* Population distribution;
* Note that this is a hypothetical distribution;
title 'Population distribution (hypothetical)';
proc univariate data=population;
  var x;
  histogram;
run;

* Mean and standard deviation of the population distribution;
* Mean is around 40, SD is around 20;
proc means data=population;
  var x;
run;

*************************************************;
* 2) Take many samples from the population
     and obtain sample means
*************************************************;

* Take 100 samples of n = 100;
* Note that each 'replicate' is a sample;
proc surveyselect data=population method=SRS rep=100 sampsize=100 out=many_samples;
  id _all_;
run;

* Calculate mean from each sample;
proc means data=many_samples;
  class replicate;
  var x;
  output out=sample_means(where=(_type_ = 1)) mean=sample_mean;
run;

* Calculate a 95% confidence interval for each sample;
data sample_means; set sample_means; 
  Lower95CI = sample_mean - 1.96 * 20 / sqrt(100);
  Upper95CI = sample_mean + 1.96 * 20 / sqrt(100);

* Check if the confidence interval include the true mean;
  if (Lower95CI <=  40 <= Upper95CI) then include = 1;
  else include = 0;
run;

* Plot all confidence intervals;
proc sgplot data=sample_means;
  highlow y = replicate low = Lower95CI high = Upper95CI / close = sample_mean group = include;
  refline 40 / axis = x;
run;

* How many CIs include the true value?;
proc freq data=sample_means;
  table include;
run;

* Example 6 (Confidence interval for mean);
data weight;
  input weight @@;
  cards;
67.2 93.8 74.1 64.8 80.0
55.9 71.2 60.2 80.1 88.6
75.8 66.0 84.5 49.1 63.9
68.8
;

proc means data=weight mean std lclm uclm alpha=0.05;
  var weight;
run;

* Example 7 (Confidence interval for the difference between two means);
data transverse;
  input gender diameter @@;
  cards;
 1 12.70  1 13.41  1 11.95  1 14.66  1 12.22
 1 13.42  1 12.40  1 15.00  1 11.72  1 14.07
 1 13.74  1 13.23
 2 11.17  2  9.69  2 11.59  2 11.10  2 11.97
 2 12.75  2  9.81  2 10.27  2 10.67
;
proc ttest data=transverse alpha=.01;
  class gender;
  var diameter;
run;

* Example 9 (Confidence interval for proportion);
data alcohol;
  input drinker $ count;
  cards;
y 88
n 37
;
proc freq data=alcohol;
  weight count;
  table drinker /binomial (level='y') alpha=.10;
run;

* Example 10 (Confidence interval for difference of two proportions);
data trial;
  input treatment $ Outcome $ count;
  cards;
Placebo favor 16
Placebo unfav 48
Drug    favor 40
Drug    unfav 20
;
proc freq data=trial;
  weight count;
  table treatment * outcome/ riskdiff alpha=.05;
run;
