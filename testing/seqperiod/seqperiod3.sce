//testing seqperiod.sci; 
//testing for logical and syntactic errors.
// output:
// 17
// 1

x = [4 0 1 6 2 0 2 7 4 0 1 6 3 2 0 2 8];
[P, N] = seqperiod(x);

disp(P);
disp(N);
