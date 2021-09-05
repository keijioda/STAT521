
* STAT 521: Assignment 7;

* Problem 1: Birth weight of infants;
data Prob1;
  input smoke weight @@;
  cards;
1 8.56	2 7.39	3 5.97	4 7.03
1 8.47	2 8.64	3 6.77	4 5.24
1 6.39	2 8.54	3 7.26	4 6.14
1 9.26	2 5.37	3 5.74	4 6.74
1 7.98	2 9.21	3 8.74	4 6.62
1 6.84	2 6.63	3 6.30	4 7.37
1 7.87			3 5.52	4 4.94
						4 6.34
;
proc sort; by smoke; run;
proc print;run;
