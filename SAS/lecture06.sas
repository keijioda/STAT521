
* STAT 521: Lecture 6;

* Sample size for estimating mean;
* READ MACRO FIRST!;
%macro Sample_Size_For_Estimating_Mean(alpha = .05, SD=, Width=);
data SampleSize;
 alpha = &alpha; SD = &SD; Width = &Width;
 z = probit(1 - alpha / 2);
 n = (z * SD / Width)** 2;
run;
proc print noobs;run;
%mend;

%Sample_Size_For_Estimating_Mean(alpha=.05, SD=15, Width=2);
%Sample_Size_For_Estimating_Mean(alpha=.10, SD=20, Width=5);
%Sample_Size_For_Estimating_Mean(alpha=.05, SD=0.6, Width=0.2);


* Sample size for estimating proportion;
* READ MACRO FIRST!;
%macro Sample_Size_For_Estimating_Prop(alpha = .05, Prop=, Width=);
data SampleSize;
 alpha = &alpha; prop = &prop; Width = &width;
 z = probit(1 - alpha / 2);
 n = (z / Width)** 2 * prop * (1-prop);
run;
proc print noobs;run;
%mend;

%Sample_Size_For_Estimating_Prop(alpha = .10, Prop=0.75, Width=0.04);
%Sample_Size_For_Estimating_Prop(alpha = .05, Prop=0.50, Width=0.05);


* Confidence interval for variance;
data one; 
  input age @@; 
  cards; 
74 81 70 70 74 77 76 70 71 72 
;
run;

proc univariate data=one cibasic alpha=.05; 
  var age; 
run; 
