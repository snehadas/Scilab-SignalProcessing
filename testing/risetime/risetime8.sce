// Testing risetime.sci
// Checking for logical and syntactic errors
// Output:
//    2.875  
//   0.625  
//   13.7875  
//   13.5625  
//   0.225 
 

  X = [7 6 5 8 3 6 8 7 5 2 4 7 4 3 2 5 4 9 5 3 5 7 3 9 4 1 2 0 5 4 8 6 4 6 5 3];
  Fs = 2;
  TOL =0.000001;
  PRL = [5, 95];
  SL = [0.5, 3]
  [R,LT,UT,LL,UL]= risetime(X, Fs, 'Tolerance', TOL, 'PercentReferenceLevels', PRL, 'StateLevels', SL);
  disp(R, LT, UT, LL, UL);
