
* STAT 521: Lecture 12;

data one;
  input outcome $ count;
  cards;
  head 40
  tail 60
;
run;
proc freq data=one;
  weight count;
  table outcome /chisq testf=(50 50);
  * Use TESTF= to specify the expected frequencies;
run;

data two;
  input outcome count;
  cards;
1 18
2 23
3 15
4 22
5 17
6 25
;
run;
proc freq data=two;
  weight count;
  table outcome /chisq testf=(20 20 20 20 20 20);
run;

data three;
  input gender $ smoking $ count;
  cards;
M Yes 60
M No  40
F Yes 80
F No  70
;
run;
proc freq data=three;
  weight count;
  table gender * smoking /chisq;
run;

data four;
  input income educ count;
  cards;
1 1 45
1 2 10
1 3  5
2 1 38
2 2 40
2 3 12
3 1 17
3 2 50
3 3 33
;
proc freq data=four;
  weight count;
  table income * educ /norow nocol nopercent expected chisq;
run;

data five;
  input group $ migraine $ count;
  cards;
narcol Yes 21
narcol No  75
health Yes 19
health No  77
;
proc freq data=five;
  weight count;
  table group * migraine /chisq;
run;

data six;
  input row col count;
  cards;
1 1 2
1 2 9
2 1 8
2 2 7
;
proc freq data=six;
  weight count;
  table row * col /chisq fisher;
run;
