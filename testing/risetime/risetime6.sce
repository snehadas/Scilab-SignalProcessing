// Testing risetime.sci
// Checking for logica and syntactic errors
// Output: 0.1485    0.1485    0.1485    0.0891    0.22275    0.07425    0.0891    0.111375  
//   0.22275  
 

  X = [7 6 5 8 3 6 8 7 5 2 4 7 4 3 2 5 4 9 5 3 5 7 3 9 4 1 2 0 5 4 8 6 4 6 5 3];
  Fs = 2;
  TOL =0.000001;
  PRL = [5, 95];
  r = risetime(X, Fs, 'Tolerance', TOL, 'PercentReferenceLevels', PRL);
  disp(r);
