// Testing pulsesep.sci
// Checking for logica and syntactic errors
// Output: 1.    1.5    0.3    0.75    0.3125    2.    0.3125    0.25  
// Also plot plotted

  X = [7 6 5 8 3 6 8 7 5 2 4 7 4 3 2 5 4 9 5 3 5 7 3 9 4 1 2 0 5 4 8 6 4 6 5 3];
  Fs = 2;
  r = pulsesep(X, Fs);
  disp(r);
