//testing seqperiod.sci; 
//testing for logical and syntactic errors.
// output:
// 4.    1.    4.    3.

x = [4 0 1 6; 2 0 2 7; 4 0 1 5; 3 0 5 6];

P = seqperiod(x);
disp(P);
