
* STAT 521: Lecture 2;

* PDF and CDF of a binomial distribution;
* Change n and p as you wish;
data binomial;
  n = 10;
  p = 0.4;
  do x = 0 to n;
    pdf = pdf('binomial', x, p, n);
    cdf = cdf('binomial', x, p, n);
    output;
  end;
run;
proc print noobs;run;

* Probability histogram of a binomial distribution;
proc sgplot data=binomial;
  vbar x / response=pdf stat=sum;
  yaxis label = "Probability";
run;

* PDF and CDF of a Poisson distribution;
* Change lambda as you wish;
data poisson;
  lambda = 3;
  do x = 0 to 15; 
    pdf = pdf('poisson', x, lambda);
    cdf = cdf('poisson', x, lambda);
    output;
  end;
run;
proc print noobs;run; 

* Probability histogram of a Poisson distribution;
proc sgplot data=poisson;
  vbar x / response=pdf stat=sum;
  yaxis label = "Probability";
run;
