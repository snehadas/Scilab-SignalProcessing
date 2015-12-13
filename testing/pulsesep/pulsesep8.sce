// Testing pulsesep.sci
// Checking for logical and syntactic errors
// Output:
//    4.302  
//   5.0503333    7.3836667    8.0302    9.8255    11.1085    13.9302    14.53775  16.0755  
//   4.1163333    5.9496667    7.849    9.1745    10.83725    11.9698    14.349  15.9245  
//   2.217    5.0503333    7.3836667    8.0302    9.8255    11.1085    13.9302   14.53775  
//   0.934    1.434    0.1812    0.651    0.27125    1.9604    0.18875    0.151  
 

  X = [7 6 5 8 3 6 8 7 5 2 4 7 4 3 2 5 4 9 5 3 5 7 3 9 4 1 2 0 5 4 8 6 4 6 5 3];
  Fs = 2;
  TOL =0.0001;
  MPRL = 30;
  SL = [0.5, 3]
  [R,LT,UT,LL,UL]= pulsesep(X, Fs, 'Tolerance', TOL, 'MidPercentReferenceLevel', MPRL);
  disp(R, LT, UT, LL, UL);
