
* STAT 521: Assignment 4;

* Problem 2 data;
data prob2;
  input area group;
  cards;
2.62	1
1.60	1
2.39	1
2.05	1
2.09	1
2.28	1
2.57	1
1.80	1
2.67	1
1.19	1
3.79	1
2.33	1
1.98	1
3.91	1
3.53	1
3.01	1
2.45	1
2.81	1
3.21	1
2.56	1
2.26	1
2.39	1
2.55	1
3.70	1
3.59	1
1.53	1
2.82	1
3.61	1
2.10	1
2.61	1
3.72	2
1.33	2
4.26	2
3.11	2
5.02	2
5.42	2
4.97	2
3.95	2
4.30	2
2.36	2
3.08	2
3.94	2
3.62	2
3.35	2
2.58	2
2.98	2
2.87	2
3.67	2
3.32	2
4.39	2
3.02	2
2.62	2
2.25	2
4.11	2
3.87	2
1.64	2
4.00	2
3.73	2
3.15	2
3.72	2
3.12	2
3.08	2
2.73	2
3.54	2
2.76	2
2.22	2
3.57	2
4.37	2
3.43	2
2.22	2
5.28	2
3.63	2
3.58	2
2.73	2
2.37	2
5.28	2
;
run;
proc print;run;

* Problem 4 data;
data prob4;
  input ID Base Follow;
  cards;
1	16	19
2	26	19
3	13	 9
4	20	23
5	22	25
6	21	20
7	20	10
8	15	20
9	25	22
10	20	18
11	11	 6
12	22	21
13	18	17
14	21	13
15	25	25
16	17	21
17	26	22
18	18	22
19	7	 9
20	25	24
21	22	15
22	15	 9
23	19	 7
24	23	20
25	19	19
26	21	24
27	24	23
28	21	15
29	28	27
30	18	26
31	25	26
32	25	26
33	28	28
34	25	14
35	21	17
36	14	22
37	23	22
38	19	16
39	19	15
40	18	23
41	20	21
42	18	11
43	22	22
44	7	17
45	23	 9
46	19	16
47	17	16
48	22	20
49	19	23
50	5	17
51	22	17
52	12	 6
53	19	19
54	17	20
55	7	 6
56	27	10
57	22	16
58	16	14
59	26	24
60	17	19
61	23	22
62	23	23
63	13	 3
64	24	22
65	17	21
66	22	21
;
proc print;run;
