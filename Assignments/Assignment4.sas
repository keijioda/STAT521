
* STAT 521: Assignment 4;

* Problem 1: Resting pulse of n = 17;
data pulse;
  input pulse @@;
  cards;
54  63  88  72  49  92  70  73  69  101  48  66  80  64  77  83  91
;
run;


* Problem 2: Low birth data;
* Read lowbwt data from a website (require internet connection);
filename lbw url "http://openwetware.org/images/8/8c/Lowbwt.txt";

data lowbwt;
  infile lbw firstobs = 3;
  input sbp sex tox grmhem gestage apgar5;
run;

proc print; run;
