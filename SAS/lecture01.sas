
* STAT 521: Lecture 1;

* Probability as long-run relative frequency;
* Estimating p(Head) in a coin toss;

* Define macro for the law of large numbers;
%macro lln(n = 1000, chains = 5);
data one;
  do Chain = 1 to &chains;
    do Trial = 1 to &n;
      if Trial = 1 then cumsum = 0;
      x = rand('bernoulli', 0.5);
      cumsum = cumsum + x;
      prob = cumsum / Trial;
      output;
    end;
  end;
  label prob = "p(Head)";
run;
title "Probability as long-run relative frequency";
proc sgplot data = one noautolegend;
  series x = trial y = prob / group = chain lineattrs = (color = gray);
  refline 0.5 / lineattrs = (color = red);
  yaxis min = 0 max = 1;
run;
title;
%mend;

* Run the function for 1 chain of 1000 trials;
%lln(chains = 1);

* By default, it runs 1000 trials for each of 5 chains;
%lln();

* 2000 trials, 10 chains;
%lln(n = 2000, chains = 10);
