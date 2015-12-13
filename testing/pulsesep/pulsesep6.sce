// Testing pulsesep.sci
// Checking for logica and syntactic errors
// Output: 0.934    1.434    0.1812    0.651    0.27125    1.9604    0.18875    0.151  

 

  X = [7 6 5 8 3 6 8 7 5 2 4 7 4 3 2 5 4 9 5 3 5 7 3 9 4 1 2 0 5 4 8 6 4 6 5 3];
  Fs = 2;
  TOL =0.0001;
  MPRL = 30;
  r = pulsesep(X, Fs, 'Tolerance', TOL, 'MidPercentReferenceLevel', MPRL);
  disp(r);
