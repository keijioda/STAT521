
* STAT 521: Lecture 4;

* Example of Central Limit Theorem;

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
proc sgplot data=population;
  histogram x;
run;

* Mean and standard deviation of the population distribution;
* Mean is around 40, SD is around 20;
proc means data=population;
  var x;
run;
title;


*************************************************;
* 2) Take many samples from the population
     and obtain sample means
*************************************************;

* Take a random sample of n = 40;
proc surveyselect data=population method=SRS rep=1 sampsize=40 out=sample1;
  id _all_;
run;
proc print;run;

* Histogram from the 1st sample;
title 'Histogram: Sample 1';
proc sgplot data=sample1;
  histogram x;
run;

* Calculate mean of the 1st sample;
proc means data=sample1 n mean stddev;
  var x;
run;

* Now, take 1000 samples of n = 40;
* Note that each 'replicate' is a sample;
proc surveyselect data=population method=SRS rep=1000 sampsize=40 out=many_samples;
  id _all_;
run;
proc print data=many_samples(obs=120);run;

* Calculate mean from each sample;
proc means data=many_samples n mean stddev;
  class replicate;
  var x;
  output out=sample_means(where=(_type_ = 1)) mean=sample_mean;
run;

*************************************************;
* 3) Produce the sampling distribution of mean
*************************************************;

* Histogram of sample means;
title 'Sampling distribution of means';
proc sgplot data=sample_means;
  histogram sample_mean;
  density sample_mean / type = normal;
run;

* Look at the mean and standard deviation of sample means;
* Mean is around 40, SD is around 20/sqrt(40) = 3.16;
proc means data=sample_means n mean stddev;
  var sample_mean;
run;
title;
