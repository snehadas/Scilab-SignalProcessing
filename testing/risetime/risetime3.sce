// Testing risetime.sci
// Checking for logical and syntactic errors
// Output:  0.132    0.132    0.132    0.0792    0.198    0.066    0.0792    0.099    0.198 
.

  X = [7 6 5 8 3 6 8 7 5 2 4 7 4 3 2 5 4 9 5 3 5 7 3 9 4 1 2 0 5 4 8 6 4 6 5 3];
  Fs = 2;
  Ts = 1/Fs;
  t = (0:(length(X)-1))*Ts
  r = risetime(X, t);
  disp(r);
