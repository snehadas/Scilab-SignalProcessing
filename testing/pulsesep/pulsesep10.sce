// Testing pulsesep.sci
// Checking for logica and syntactic errors
// Output:  1.8993333    0.8993333    0.4653333    1.1443    1.01175    0.8613    0.4188  
// 1.38675    1.099  

 

  X = [7 6 5 8 3 6 8 7 5 2 4 7 4 3 2 5 4 9 5 3 5 7 3 9 4 1 2 0 5 4 8 6 4 6 5 3];
  Fs = 2;
  TOL =0.0001;
  MPRL = 30;
  r = pulsesep(X, Fs, 'Tolerance', TOL, 'MidPercentReferenceLevel', MPRL, 'Polarity', 'Negative');
  disp(r);
