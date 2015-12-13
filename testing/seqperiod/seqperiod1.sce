//testing seqperiod.sci; 
//testing for logical and syntactic errors.
// output:
//1.    1.    1.    1.    1.    1.    1.    1.    1.    1.    1.    1.  
//2.    2.    2.    2.    2.    2.    2.    2.    2.    2.    2.    2. 

x = repmat([32,43,54],2,4);
[P, N] = seqperiod(x);
disp(P);
disp(N);

